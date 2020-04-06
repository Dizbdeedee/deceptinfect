package deceptinfect.radiation;

import deceptinfect.radiation.RadiationProducer.RadiationProduceOptions;

class RadiationTypes {

    public static var types:Map<RadTypes,RadiationProduceOptions> = [
        NEST => {
            maxrate: 6,
            radius: 500,
            contaminate: {
                chance: 2/5,
                dist: 20,
                time: 60,
                check: 0.8,
                type : SAME_SOURCE
            },
            lifetime: INFINITE,

        },
        CORPSE => {
            maxrate: 6,
            radius: 350,
            contaminate: {
                chance: 0.5,
                time: 35,
                check: 0.5,
                dist: 50,
                type: SAME_SOURCE
            },
            lifetime: FINITE(25)
        },
        INF => {
            maxrate: 4.5,
            radius: 300,
            contaminate: {
                chance: 0.4,
                time: 20,
                check: 0.3,
                dist: 50,
                type: SAME_SOURCE
            },
            lifetime: INFINITE
        },
        PUSTLE => {
            maxrate: 3,
            radius: 400,
            
        },
        SPIT_HIT => {
            maxrate: 5,
            radius: 250,
            contaminate: {
                chance: 0.8,
                time: 7,
                check: 0.3,
                dist: 60,
                type: ALWAYS
            }
        },
        SPIT => {
            maxrate: 4.5,
            radius: 200,
        }

    ];
    
}

enum RadTypes {

    NEST;
    CORPSE;
    INF;
    PUSTLE;
    SPIT_HIT;
    SPIT;
}