local rainbow = (import "../rainbow.libsonnet");

(import "../base.libsonnet") + {

    # Comment this out when using bin/create_holdout
    initial_state_path:: 'rainbow_build/initial_state_20200729_185230.npz',

    # Comment this out when using bin/create_holdout
    goal_state_paths:: [
        # Four stacked rainbow blocks with yellow on top (largest -> smallest)
        'rainbow_build/goal_state_20200729_185310.npz',
    ],

    task_object_configs:: [
        rainbow['yellow'],
        rainbow['green'],
        rainbow['blue'],
        rainbow['violet']
    ],

    make_env +: {
        args +: {
            constants +: {
                success_threshold: {'obj_pos': 0.02, 'obj_rot': 0.2},
            },
        },
    },

}
