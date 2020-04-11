// ex DB

const post1 = {
    id:1,
    title:"title1",
    body:"body1"
}
const post2 = {
    id:2,
    title:"title2",
    body:"body2"
}
const post3 = {
    id:3,
    title:"title3",
    body:"body3"
}
const post4 = {
    id:4,
    title:"title4",
    body:"body4"
}

const allPosts = [post1,post2,post3,post4]




module.exports = {
    posts: function(req,res) {
        
        res.send(allPosts)
    },

    create: function(req,res){

    },


    findById: function(req,res) {
        const postId = req.param("postId")

        const filteredPosts = allPosts.filter(p => { return p.id == postId})

        if (filteredPosts.length>0){
            res.send(filteredPosts[0])
        }else{
            res.send("not found by id" + postId)
        }
    } 
}