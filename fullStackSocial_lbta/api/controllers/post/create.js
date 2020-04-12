module.exports = {


  friendlyName: 'Create',
  

  description: 'Create post.',


  inputs: {
    title: {
      description : 'title of post object',
      type: 'string',
      required: true
    },
    postBody: {
      description: 'a',
      type: 'string',
      required : true
    }


  },


  exits: {
  },


  fn: async function (inputs) {

    const post = await Post.create({title:inputs.title, body: inputs.postBody}).fetch()
    return post;

  }


};
