package com.stackroute.keepnote.model;

import java.time.LocalDateTime;
import java.time.LocalTime;
import java.util.Date;

public class Note {
	private int noteId;
	private String noteTitle;
	private String noteContent;
	private String noteStatus;
	private LocalDateTime createdAt;

	public Note() {
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

	public void setNoteTitle(String string) {
		this.noteTitle = noteTitle;
	}

	public String getNoteContent() {
		return noteContent;
	}

	public void setNoteContent(String string) {
		this.noteContent = noteContent;
	}

	public String getNoteStatus() {
		return noteStatus;
	}

	public void setNoteStatus(String string) {
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