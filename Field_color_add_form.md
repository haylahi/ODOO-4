Using 2 fields to show color in form view, Here i am using "Next Due" Field in product based on contion, field show as "Red" 

Python:

        date_next_due = fields.Datetime(string="Next Due", compute='_compute_next_due_date')
        date_next_due_red = fields.Datetime(string="Next Due", compute='_compute_next_due_date')
        is_next_due_red = fields.Boolean(string="Next Due", compute='_compute_next_due_date')

        def _compute_next_due_date(self):
            move_obj = self.env['stock.move']
            for product in self:
                move_id = move_obj.search([('origin', 'like', 'PO'), ('product_id.product_tmpl_id', '=', product.id), ('state', '!=', 'done')], order='date_expected desc', limit=1)
                product.date_next_due = move_id.date_expected
                product.date_next_due_red = product.date_next_due
                if (product.date_next_due and  product.date_next_due < fields.Datetime.now()) and (move_id and move_id.date_expected):
                    product.is_next_due_red = True


XML:

        <group name="group_standard_price" position="inside">
          <field name="is_next_due_red" invisible="1"/>
          <field name="date_next_due_red" class="text-danger" attrs="{'invisible': [('is_next_due_red', '=', False)]}"/>
          <field name="date_next_due" attrs="{'invisible': [('is_next_due_red', '!=', False)]}"/>
        </group>
