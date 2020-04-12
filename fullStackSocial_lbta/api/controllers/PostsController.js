
module.exports = {
    posts: async function(req,res) {
        try {
            const posts = await Post.find()
            res.send(posts)
        } catch (error) {
            return res.serverError(error.toString())
        }
        
    },
    findById: function(req,res) {
        const postId = req.param("postId")

        const filteredPosts = allPosts.filter(p => { return p.id == postId})

        if (filteredPosts.length>0){
            res.send(filteredPosts[0])
        }else{
            res.send("not found by id" + postId)
        }
    },
}