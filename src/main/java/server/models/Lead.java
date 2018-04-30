package server.models;

import java.util.ArrayList;


public class Lead {
    private int leadId;
    private String firstName;
    private String surname;
    private String email;
    private boolean isDuplicate;

    public Lead() {
    }

    public Lead(int leadId, String firstName, String surname, String email, boolean isDuplicate) {
        this.leadId = leadId;
        this.firstName = firstName;
        this.surname = surname;
        this.email = email;
        this.isDuplicate = isDuplicate;
    }

    public int getLeadId() {
        return leadId;
    }

    public void setLeadId(int leadId) {
        this.leadId = leadId;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getSurname() {
        return surname;
    }

    public void setSurname(String surname) { this.surname = surname; }

    public String getEmail() { return email; }

    public void setEmail(String email) { this.email = email; }

    public boolean isDuplicate() {
        return isDuplicate;
    }

    public void setIsDuplicate(boolean isDuplicate) {
        this.isDuplicate = isDuplicate;
    }
}
