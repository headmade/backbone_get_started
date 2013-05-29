$(function() {
    var User = Backbone.Model.extend({
        schema: {
            maf_last_name:       { type: 'Text', validators: ['required'] },
            maf_email:       { type: 'Text', validators: ['email', 'required'] },
        }
    });

    var user = new User({
        maf_last_name: 'Sterling',
        maf_email: 'sterlingi@sis.com',
    });

    var form = new Backbone.Form({
        template: _.template($('#form_block_1').html()),
        model: user
    }).render();

    form.on('change', function(form, titleEditor) {
            console.log('Title changed to'+form);
            form.validate();
    });

    $('.block_bg').append(form.el);
});

