package PostBean;

public class Post {
    private int postid;
    private String comment;
    private String username;
    private String useremail;

    public Post() {
        postid = 0;
        comment = null;
        username = null;
        useremail = null;
    }

    public void setPostid(int postid) {
        this.postid = postid;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public void setUsername(String username) {
        this.username = username;
    }
    public void setUseremail(String useremail) {
        this.useremail = useremail;
    }

    public int getPostid() {
        return postid;
    }

    public String getComment() {
        return comment;
    }

    public String getUseremail() {
        return useremail;
    }

    public String getUsername() {
        return username;
    }
}
