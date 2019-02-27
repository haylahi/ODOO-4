#Version Odoo 10.0

# Function Call : self.create_portal_access([1,2,3])

@api.multi
def create_portal_access(self, partner_ids=[]):
    # param partner_ids : Customer ids
    if not isinstance(partner_ids, list) or partner_ids == []:
        partner_ids = self.id and [self.id] or []
    try:
        if partner_ids:
            wiz_id = self.env['portal.wizard'].with_context(active_ids=partner_ids, from_magento=True).create({})
            if wiz_id:
                wiz_id.onchange_portal_id()  # update user_ids
                wiz_id.user_ids.write({'in_portal': True})  # Portal check box enable
                wiz_id.action_apply()  # Initiating create portal access
                self.user_password_change(partner_ids, '12345609')  # Set new created portal users password
                return True
    except Exception as e:
        # raise UserError("Error -> Portal Access {0}: {1}".format(partner_ids, e))
        return "Error -> Portal Access {0}: {1}".format(partner_ids, e)

@api.multi
def user_password_change(self, partner_ids, new_password):
    if partner_ids:
        user_ids = self.env['res.users'].sudo().search([('partner_id', 'in', partner_ids), ('share', '=', True)])
        if user_ids and new_password:
            for user in user_ids:
                user.write({'password': new_password})
