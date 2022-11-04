package com.project.like;

public interface LikeService {

	int likeCheck(int re_no, String id) throws Exception;

	void insertLike(int re_no, String id) throws Exception;
	
	void updateLike(int re_no) throws Exception;
	
	void updateLikeCancel(int re_no) throws Exception;
	
	void deleteLike(int re_no, String id) throws Exception;
	
}
