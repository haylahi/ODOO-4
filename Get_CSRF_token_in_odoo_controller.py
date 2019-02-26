
# Get CSRF token for login odoo with external via third party apps
from odoo.http import Controller, route, request, Response

@route('/base_import_module/login', type='http', auth='none', methods=['POST'], csrf=False)
    @webservice
    def login(self, login, password, db=None):
        if db and db != request.db:
            raise Exception(_("Could not select database '%s'") % db)
        uid = request.session.authenticate(request.db, login, password)
        if not uid:
            return Response(response="Wrong login/password", status=401)
        self.check_user(uid)
        return Response(headers={
            'X-CSRF-TOKEN': request.csrf_token(),
        })
