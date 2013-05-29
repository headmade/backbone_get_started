$(function() {
    var User = Backbone.Model.extend({
        schema: {
            title:      { type: 'Select', options: ['', 'Mr', 'Mrs', 'Ms'] },
            name:       { type: 'Text', validators: ['required'] },
            email:      { validators: ['required', 'email'] },
            birthday:   'Date',
            password:   'Password',
        }
    });

    var user = new User({
        title: 'Mr',
        name: 'Sterling Archer',
        email: 'sterlingi@sis.com',
        birthday: new Date(1978, 6, 12),
        password: 'dangerzone',
        notes: [
            'Buy new turtleneck',
            'Call Woodhouse',
            'Buy booze'
        ]
    });

    var form = new Backbone.Form({
        model: user
    }).render();

    form.on('change', function(form, titleEditor) {
            console.log('Title changed to');
            form.validate();
    });

    $('body').append(form.el);
});

