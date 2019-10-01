package com.stackroute.keepnote.model;

import java.time.LocalDateTime;

public class Note {
	private int noteId;
	private String noteTitle = "Title";
	private String noteContent = "this is sample content";
	private String noteStatus = "done";
	private LocalDateTime createdAt;

	public Note(){ }

	public Note(int noteId, String noteTitle, String noteContent, String noteStatus) {
		this.noteId = noteId;
		this.noteTitle = noteTitle;
		this.noteContent = noteContent;
		this.noteStatus = noteStatus;
	}

	public int getNoteId() {
		return noteId;
	}

	public void setNoteId(int intid) {
		this.noteId = intid;
	}

	public String getNoteTitle() {
		return noteTitle;
	}

	public void setNoteTitle(String noteTitle) {
		this.noteTitle = noteTitle;
	}

	public String getNoteContent() {
		return noteContent;
	}

	public void setNoteContent(String noteContent) {
		this.noteContent = noteContent;
	}

	public String getNoteStatus() {
		return noteStatus;
	}

	public void setNoteStatus(String noteStatus) {
		this.noteStatus = noteStatus;
	}

	public LocalDateTime getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(LocalDateTime localdatetime) {
		this.createdAt = localdatetime;
	}

	/* Override the toString() method */

	@Override
	public String toString() {
		return null;
	}

}