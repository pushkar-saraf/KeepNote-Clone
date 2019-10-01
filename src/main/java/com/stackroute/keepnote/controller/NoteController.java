package com.stackroute.keepnote.controller;

import com.stackroute.keepnote.model.Note;
import com.stackroute.keepnote.repository.NoteRepository;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.time.LocalDateTime;

@Controller
public class NoteController {

    private static Note note;
    private static NoteRepository noteRepository;

    /*
     * From the problem statement, we can understand that the application
     * requires us to implement the following functionalities.
     *
     * 1. display the list of existing notes from the collection. Each note
     *    should contain Note Id, title, content, status and created date.
     * 2. Add a new note which should contain the note id, title, content and status.
     * 3. Delete an existing note.
     * 4. Update an existing note.
     */

    /*
     * Get the application context from resources/beans.xml file using ClassPathXmlApplicationContext() class.
     * Retrieve the Note object from the context.
     * Retrieve the NoteRepository object from the context.
     */


    /*Define a handler method to read the existing notes by calling the getAllNotes() method
     * of the NoteRepository class and add it to the ModelMap which is an implementation of Map
     * for use when building model data for use with views. it should map to the default URL i.e. "/" */

    @RequestMapping(value = "/")
    public ModelAndView base(ModelMap modelMap) {
        ApplicationContext applicationContext = new ClassPathXmlApplicationContext("beans.xml");
        note = (Note) applicationContext.getBean("note");
        noteRepository = (NoteRepository) applicationContext.getBean("noteRepository");
        modelMap.addAttribute("notes", noteRepository.getAllNotes());
        modelMap.addAttribute("note", note);
        modelMap.addAttribute("id", 0);
        noteRepository.getAllNotes();
        return new ModelAndView("index", "note", note);
    }

    @RequestMapping(value = "/index")
    public ModelAndView index(ModelMap modelMap) {
        modelMap.addAttribute("notes", noteRepository.getAllNotes());
        modelMap.addAttribute("note", note);
        modelMap.addAttribute("id", 0);
        noteRepository.getAllNotes();
        return new ModelAndView("index", "note", note);
    }

    /*Define a handler method which will read the Note data from request parameters and
     * save the note by calling the addNote() method of NoteRepository class. Please note
     * that the createdAt field should always be auto populated with system time and should not be accepted
     * from the user. Also, after saving the note, it should show the same along with existing
     * notes. Hence, reading notes has to be done here again and the retrieved notes object
     * should be sent back to the view using ModelMap.
     * This handler method should map to the URL "/saveNote".
     */
    @RequestMapping(value = "/saveNote", method = RequestMethod.GET)
    public ModelAndView addNote(Note n, ModelMap modelMap, RedirectAttributes ra) {
        n.setCreatedAt(LocalDateTime.now());
        NoteController.noteRepository.addNote(n);
		System.out.println(n.getNoteId()+ n.getNoteContent());
		note.setNoteId(note.getNoteId()+1);
		note.setNoteContent("This is sample content");
		note.setNoteStatus("done");
		note.setNoteTitle("Title");
		modelMap.addAttribute("note", note);
		modelMap.addAttribute("notes",noteRepository.getAllNotes());
        return new ModelAndView("redirect:/index");
    }

    /* Define a handler method to delete an existing note by calling the deleteNote() method
     * of the NoteRepository class
     * This handler method should map to the URL "/deleteNote"
     */
    @RequestMapping(value = "/deleteNote")
    public String deleteNote(ModelMap modelMap, @RequestParam("id") int id) {
        System.out.println("got" + id);
        noteRepository.deleteNote(id);
        modelMap.addAttribute("notes", noteRepository.getAllNotes());
        modelMap.addAttribute("note",note);
        modelMap.addAttribute("id", 0);
        return "redirect:index";
    }
}