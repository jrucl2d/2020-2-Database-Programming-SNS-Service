package PostBean;

import java.sql.*;
import java.util.*;
import javax.sql.*;
import oracle.jdbc.driver.*;
import oracle.jdbc.pool.*;
import PostBean.*;

public class PostMgr {

	private OracleConnectionPoolDataSource ocpds = null;
	private PooledConnection pool = null;

	public PostMgr() {
		try {
			ocpds = new OracleConnectionPoolDataSource();

			ocpds.setURL("데이터베이스 url");
			ocpds.setUser("아이디");
			ocpds.setPassword("비밀번호");

			pool = ocpds.getPooledConnection();
		} catch (Exception e) {
			System.out.println("Error : Connection Failed");
		}
	}

	public Vector getPostList() {
		Connection conn = null;
		PreparedStatement pstmt = null;

		ResultSet rs = null;
		Vector vecList = new Vector();

		try {
			conn = pool.getConnection();

			String mySQL = "select postid, postcontent, project_user.useremail, username from project_post, project_user" +
					" where project_post.useremail=project_user.useremail and project_post.deleteddate is null " +
					"order by project_post.createddate desc";
			pstmt = conn.prepareStatement(mySQL);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				Post post = new Post();
				post.setPostid(rs.getInt("postid"));
				post.setComment(rs.getString("postcontent"));
				post.setUseremail(rs.getString("useremail"));
				post.setUsername(rs.getString("username"));

				vecList.add(post);
			}
			pstmt.close();
			conn.close();

		} catch (Exception ex) {
			System.out.println("Exception" + ex);
		}

		return vecList;
	}

	public Vector getPostList(String hashtag) {
		Connection conn = null;
		PreparedStatement pstmt = null;

		ResultSet rs = null;
		Vector vecList = new Vector();

		try {
			conn = pool.getConnection();

			String mySQL = "select p.postid, p.postcontent, u.useremail, u.username from project_post p, project_user u, project_post_hashtag ph, project_hashtag h" +
					" where p.useremail=u.useremail and p.deleteddate is null " +
					"and p.postid=ph.postid and ph.hashtagid=h.hashtagid and h.hashtagcontent like '%" + hashtag + "%' " +
					"order by p.createddate desc";
			pstmt = conn.prepareStatement(mySQL);
			rs = pstmt.executeQuery();

			while (rs.next()) {
				Post post = new Post();
				post.setPostid(rs.getInt("postid"));
				post.setComment(rs.getString("postcontent"));
				post.setUseremail(rs.getString("useremail"));
				post.setUsername(rs.getString("username"));

				vecList.add(post);
			}
			pstmt.close();
			conn.close();

		} catch (Exception ex) {
			System.out.println("Exception" + ex);
		}

		return vecList;
	}

	public void deletePost(int pid) {
		Connection conn = null;
		CallableStatement cstmt = null;

		try {
			conn = pool.getConnection();

			String mySQL = "";
			cstmt = conn.prepareCall("{call project_post_delete(?)}");
			cstmt.setInt(1, pid);
			cstmt.execute();

			cstmt.close();
			conn.close();

		} catch (Exception ex) {
			System.out.println("Exception" + ex);
		}
	}

	public int insertNewPost(String post, String useremail) {
		Connection conn = null;
		CallableStatement cstmt = null;

		try {
			conn = pool.getConnection();

			String mySQL = "";
			cstmt = conn.prepareCall("{call project_post_insert(?, ?)}");
			cstmt.setString(1, post);
			cstmt.setString(2, useremail);
			cstmt.execute();

			cstmt.close();
			conn.close();
			return 1;

		} catch (Exception ex) {
			System.out.println("Exception" + ex);
			return 0;
		}
	}

	public int updatePost(String post, int postId) {
		Connection conn = null;
		PreparedStatement pstmt = null;

		ResultSet rs = null;

		try {
			conn = pool.getConnection();
			String mySQL = "update project_post set postcontent='" + post + "' where postid=" + postId;
			pstmt = conn.prepareStatement(mySQL);
			rs = pstmt.executeQuery();
			pstmt.close();
			conn.close();
			return 1;
		} catch (Exception ex) {
			System.out.println("Exception" + ex);
			return 0;
		}
	}
}