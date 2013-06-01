class Form1 extends Backbone.Form
    schema:
        maf_first_name:
            validators: ['name']
        maf_last_name:
            validators: ['name']
        maf_email:
            validators: ['email']
        maf_second_name:
            validators: ['name']
        maf_mobile_phone:
            validators: ['phone']
            mask: "phone"
        maf_birth_date:
            validators: ['date']
            mask: "date"
        maf_accept_rules:
            validators: ['required']


class Form2 extends Backbone.Form
    schema:
        maf_zagran_fio:
            validators: ['latinname']
        maf_changed_fio:
            validators: []
        maf_passport_seria:
            validators: ['pasportseria']
            mask:       "pasportseria"
        maf_passport_number:
            validators: ['pasportnumber']
            mask:       'pasportnumber'
        maf_passport_issue:
            validators: ['name']
            mask:       'date'
        maf_passport_organisation:
            validators: ['name']
        maf_passport_code:
            validators: ['name']
            mask:       'pasportcode'
        maf_birth_place:
            validators: ['name']
