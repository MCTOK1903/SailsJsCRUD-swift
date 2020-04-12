module.exports = {


  friendlyName: 'Delete',


  description: 'Delete post.',


  inputs: {
    postId:{
      type: 'string',
      required: true
    }
  },


  exits: {
    invalid:{
      description:'This was an invalid post to delete'
    }

  },


  fn: async function (inputs) {

    const post = await Post.destroy({id:inputs.postId}).fetch()
    console.log(post)
    if(post.length == 0){
      throw({invalid: {error: 'Record does not exist'}})
    }
    return post;

  }


};
