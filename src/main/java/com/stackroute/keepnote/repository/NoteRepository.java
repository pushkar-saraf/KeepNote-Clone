package com.stackroute.keepnote.repository;

import com.stackroute.keepnote.model.Note;

import java.util.ArrayList;
import java.util.List;

public class NoteRepository {
	private ArrayList<Note> list;

	public NoteRepository() {
		list = new ArrayList<>();
	}

	public List<Note> getList() {
		return list;
	}

	public void setList(List<Note> list) {
		this.list = (ArrayList<Note>) list;
	}

	public void addNote(Note note) {
		list.add(note);
	}

	public boolean deleteNote(int noteId) {
		return list.removeIf(note -> note.getNoteId() == noteId);
	}

	/* This method should return the list of notes */

	public List<Note> getAllNotes() {
		return list;
	}

	/*
	 * This method should check if the matching note id present in the list or not.
	 * Return true if note id exists in the list or return false if note id does not
	 * exists in the list
	 */

	public boolean exists(int noteId) {
		for (Note note : list) {
			if(note.getNoteId() == noteId){
				return true;
			}
		}
		return false;
	}
}