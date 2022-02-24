package com.poetry.modules.posts.entity;

import java.io.Serializable;
import java.util.Date;

/**
 * Banner
 * 
 * @author lzl
 * @email 2803180149@qq.com
 * @date 2017-07-14 13:43:12
 */
public class PostsReplyEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	private Integer id;
	// 回复者Id
	private Integer memberId;
	//贴名
	private String memberName;
	//贴名
	private String content;
	//帖子Id
	private Integer postsId;
	// 被回复者Id
	private Integer replyMemberId;
	// 被回复者名字
	private String replyMemberName;

	// 音频路径
	private String fileUrl;

	public String getFileUrl() {
		return fileUrl;
	}

	public void setFileUrl(String fileUrl) {
		this.fileUrl = fileUrl;
	}

	private Date time;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getMemberId() {
		return memberId;
	}

	public void setMemberId(Integer memberId) {
		this.memberId = memberId;
	}

	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Integer getPostsId() {
		return postsId;
	}

	public void setPostsId(Integer postsId) {
		this.postsId = postsId;
	}

	public Integer getReplyMemberId() {
		return replyMemberId;
	}

	public void setReplyMemberId(Integer replyMemberId) {
		this.replyMemberId = replyMemberId;
	}

	public String getReplyMemberName() {
		return replyMemberName;
	}

	public void setReplyMemberName(String replyMemberName) {
		this.replyMemberName = replyMemberName;
	}

	public Date getTime() {
		return time;
	}

	public void setTime(Date time) {
		this.time = time;
	}
}
