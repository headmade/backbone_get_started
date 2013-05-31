class Form1 extends Backbone.Form
    schema:
        maf_first_name:
            validators: ['required']
        maf_last_name:
            validators: ['required']
        maf_email:
            validators: ['email']
        maf_second_name:
            validators: ['required']
        maf_mobile_phone:
            validators: ['required']
        maf_birth_date:
            validators: ['required']
        maf_accept_rules:
            validators: ['required']
