const db = require('../data/db-config.js');

module.exports = {
    find,
    findById,
    findSteps,
    add,
    update,
    remove
}

function find() {
    return db('schemes');
}

function findById(id) {
    return db('schemes')
    .where({ id })
    .first();
}

// function findSteps(id) {
//     return db('steps')
//     .join('schemes', 'steps.scheme_id', 'schemes.id')
//     .select('schemes.id', 'schemes.scheme_name', 'steps.*')
//     .where({ scheme_id: id })
// }

function findSteps(id) {
  return db('steps')
    .where("scheme_id", id)
};

function add(scheme) {
    return db('schemes').insert(scheme)
    .then(ids => {
        return findById(ids[0]);
    })
};

function update(changes, id) {
    return db('schemes')
    .where({ id })
    .update(changes)
    .then(count => {
        return findById(id);
    });
};

function remove(id) {
    return db('schemes')
    .where({ id })
    .del();
};