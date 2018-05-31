
# Ref : https://www.odoo.com/forum/how-to/developers-13/what-should-onchange-methods-do-and-return-57760
# onchange return dict structure - Example

    @api.multi
    @api.onchange('partner_id')
    def onchange_partner_id(self):
        super(magento_sale_order, self).onchange_partner_id()
        return {

            'warning': {'title': 'Error!', 'message': 'Something went wrong! Please check your data'},

            'domain': {'partner_shipping_id': [('parent_id', '=', 42)]},

            'value': {

                'partner_id': 42,

                'note': 'I was changed automatically!',

                'order_lines': [

                        (1, 13, {'discount': 30, 'quantity': 10}),

                        (1, 14, {'discount': 15, 'quantity': 34}),

                ]

            }

        }
