package com.hejin.model;

public class Announce {
    private String announceid;
    private String announcename;
    private String content;
    private String publishtime;
    private String username;
    private String role;

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getAnnouncename() {
        return announcename;
    }

    public void setAnnouncename(String announcename) {
        this.announcename = announcename;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getPublishtime() {
        return publishtime;
    }

    public void setPublishtime(String publishtime) {
        this.publishtime = publishtime;
    }

    public String getAnnounceid() {
        return announceid;
    }

    public void setAnnounceid(String announceid) {
        this.announceid = announceid;
    }
}
