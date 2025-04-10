page 52194047 "HR Employee"
{
    Caption = 'Employee Card';
    DelayedInsert = false;
    PageType = Card;
    RefreshOnActivate = true;
    SaveValues = true;
    SourceTable = Employee;

    layout
    {
        area(content)
        {
            field("gOpt Active"; "gOpt Active")
            {
                OptionCaption = 'Show Active Employees,Show Archived Employees,Show All Employees';

                trigger OnValidate()
                begin

                    IF "gOpt Active" = "gOpt Active"::All THEN
                        AllgOptActiveOnValidate;
                    IF "gOpt Active" = "gOpt Active"::Archive THEN
                        ArchivegOptActiveOnValidate;
                    IF "gOpt Active" = "gOpt Active"::Active THEN
                        ActivegOptActiveOnValidate;
                end;
            }
            field("Employee Act. Qty"; "Employee Act. Qty")
            {
                Editable = false;
            }
            field("Employee Arc. Qty"; "Employee Arc. Qty")
            {
                Editable = false;
            }
            field("Employee Qty"; "Employee Qty")
            {
                Editable = false;
            }
            group("General Information")
            {
                Caption = 'General Information';
                field("No."; "No.")
                {
                    AssistEdit = true;
                    Editable = true;

                    trigger OnAssistEdit()
                    begin
                        IF AssistEdit() THEN
                            CurrPage.UPDATE;
                    end;
                }
                field(Title; Title)
                {
                }
                field("Last Name"; "Last Name")
                {
                    DrillDown = true;
                }
                field("First Name"; "First Name")
                {
                }
                field("Middle Name"; "Middle Name")
                {
                    Caption = 'Other Names';
                }
                field(Initials; Initials)
                {
                }
                field("ID Number"; "ID Number")
                {
                }
                field("Passport Number"; "Passport Number")
                {
                }
                field("Driving Licence"; "Driving Licence")
                {
                }
                field("Last Date Modified"; "Last Date Modified")
                {
                }
                field("Postal Address"; "Postal Address")
                {
                }
                field("Postal Address2"; "Postal Address2")
                {
                }
                field("Postal Address3"; "Postal Address3")
                {
                }
                field("Post Code2"; "Post Code2")
                {
                    Caption = 'Post Code';
                    LookupPageID = "Post Codes";
                }
                field("Residential Address"; "Residential Address")
                {
                }
                field("Residential Address2"; "Residential Address2")
                {
                }
                field("Residential Address3"; "Residential Address3")
                {
                }
                field("County Code"; "County Code")
                {
                    Caption = 'County';
                }
                field("Country/Region Code"; "Country/Region Code")
                {
                }
                field(Picture; Image)
                {
                }
                field(Signature; Signature)
                {
                }
            }
            group("Personal Details")
            {
                Caption = 'Personal Details';
                field(Gender; Gender)
                {
                }
                field(Disability; Disability)
                {
                }
                field("Date Of Birth"; "Date Of Birth")
                {
                }
                field(DAge; DAge)
                {
                    Caption = 'Age';
                    Editable = false;
                }
                field("Marital Status"; "Marital Status")
                {
                }
                field(Religion; Religion)
                {
                }
                field("Ethnic Group"; "Ethnic Group")
                {
                }
                field("First Language Read"; "First Language Read")
                {
                    Caption = 'English Read';
                }
                field("First Language Write"; "First Language Write")
                {
                    Caption = 'English Written';
                }
                field("First Language Speak"; "First Language Speak")
                {
                    Caption = 'English Spoken';
                }
                field("Second Language Read"; "Second Language Read")
                {
                    Caption = 'Kiswahili Read';
                }
                field("Second Language Write"; "Second Language Write")
                {
                    Caption = 'Kiswahili Written';
                }
                field("Second Language Speak"; "Second Language Speak")
                {
                    Caption = 'Kiswahili Spoken';
                }
                field("Additional Language"; "Additional Language")
                {
                    Caption = 'Other';
                }
                field("Other Language Read"; "Other Language Read")
                {
                    Caption = 'Other Language Read';
                }
                field("Other Language Write"; "Other Language Write")
                {
                    Caption = 'Other Language Written';
                }
                field("Other Language Speak"; "Other Language Speak")
                {
                    Caption = 'Other Language Spoken';
                }
            }
            group("Job Information")
            {
                Caption = 'Job Information';
                field(Position; Position)
                {
                    Caption = 'Job Position';
                }
                field("Job Title"; "Job Title")
                {
                    Editable = false;
                }
                field("Global Dimension 1 Code"; "Global Dimension 1 Code")
                {
                    Editable = true;
                }
                field("Directorate Name"; "Directorate Name")
                {
                    Editable = false;
                }
                field("Global Dimension 2 Code"; "Global Dimension 2 Code")
                {
                    Editable = true;
                }
                field("Department Name"; "Department Name")
                {
                    Editable = false;
                }
                field(Level; Level)
                {
                    Editable = false;
                    Visible = false;
                }
                field("Employee Job Type"; "Employee Job Type")
                {
                    Caption = 'Job Type(for Fleet)';
                    Editable = true;
                }
                field("Probation Period"; "Probation Period")
                {
                    Editable = false;
                }
                field("Notice Period(Probation)"; "Notice Period(Probation)")
                {
                }
                field("Notice Period"; "Notice Period")
                {
                    Caption = 'Notice Period After Confirmation';
                    Editable = false;
                }
            }
            group("Payment Information")
            {
                Caption = 'Payment Information';
                field("PIN Number"; "PIN Number")
                {
                }
                field("NSSF No."; "Social Security No.")
                {
                }
                field("NHIF No."; "N.H.I.F No")
                {
                }
                field("HELB No"; "HELB No")
                {
                }
                field("Co-Operative No"; "Co-Operative No")
                {
                }
                field("Pay Mode"; "Pay Mode")
                {
                }
                field("Bank Account Number"; "Bank Account Number")
                {
                }
                field("Employee's Bank"; "Employee's Bank")
                {
                }
                field("Posting Group"; "Posting Group")
                {
                    Caption = 'HR Posting Group/Contract Type';
                }
                field("Salary Scale"; "Salary Scale")
                {
                    Caption = 'Grade';
                }
                field(Present; Present)
                {
                }
                field(Previous; Previous)
                {
                    Editable = false;
                }
                field(Halt; Halt)
                {
                    Editable = false;
                }
            }
            group("Important Dates")
            {
                Caption = 'Important Dates';
                field("Date Of Join"; "Date Of Join")
                {
                    Caption = 'Date of Joining Company';
                }
                field(DService; DService)
                {
                    Caption = 'Length of Service';
                    Editable = false;
                }
                field("End Of Probation Date"; "End Of Probation Date")
                {
                }
                field("Pension Scheme Join"; "Pension Scheme Join")
                {
                }
                field(DPension; DPension)
                {
                    Caption = 'Time On Pension Scheme';
                    Editable = false;
                }
                field("Medical Scheme Join"; "Medical Scheme Join")
                {
                }
                field(DMedical; DMedical)
                {
                    Editable = false;
                }
                field("Retirement Date"; "Retirement Date")
                {
                    Editable = false;
                }
            }
            group("Contact Numbers")
            {
                Caption = 'Contact Numbers';
                field("Home Phone Number"; "Home Phone Number")
                {
                }
                field("Mobile Phone No."; "Mobile Phone No.")
                {
                }
                field("Fax Number"; "Fax Number")
                {
                }
                field("Work Phone Number"; "Work Phone Number")
                {
                }
                field("Ext."; "Ext.")
                {
                }
                field("E-Mail"; "E-Mail")
                {
                }
            }
            group("Contract Information")
            {
                Caption = 'Contract Information';
                field("Full / Part Time"; "Full / Part Time")
                {
                }
                field("Contract Type"; "Contract Type")
                {
                }
                field("Contract Number"; "Contract Number")
                {
                }
                field("Contract Start Date"; "Contract Start Date")
                {
                }
                field("Contract End Date"; "Contract End Date")
                {
                }
                field("Send Alert to"; "Send Alert to")
                {
                }
            }
            group(Separation)
            {
                Caption = 'Separation';
                field("Date Of Leaving"; "Date Of Leaving")
                {
                }
                field("Served Notice Period"; "Served Notice Period")
                {
                }
                field("Termination Category"; "Termination Category")
                {
                }
                field("Grounds for Term. Code"; "Grounds for Term. Code")
                {
                }
                field(Status; Status)
                {
                }
                field("Exit Interview Date"; "Exit Interview Date")
                {
                }
                field("Exit Interview Done by"; "Exit Interview Done by")
                {
                }
                field("Allow Re-Employment In Future"; "Allow Re-Employment In Future")
                {
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group("Employee's")
            {
                Caption = 'Employee''s';
                group("Employee Details")
                {
                    Caption = 'Employee Details';
                    action("Q&ualifications")
                    {
                        Caption = 'Q&ualifications';
                        RunObject = Page "Emp Qualification";
                        RunPageLink = "No." = FIELD("No.");
                    }
                    action("Employment History")
                    {
                        Caption = 'Employment History';
                        RunObject = Page "Employment History";
                        RunPageLink = "No." = FIELD("No.");
                    }
                    action("Employee Responsibilities1")
                    {
                        Caption = 'Employee Responsibilities';
                        RunObject = Page "J. Responsiblities";
                        RunPageLink = "Job ID" = FIELD("No.");
                    }

                    action("Employee Appointment Checklist")
                    {
                        Caption = 'Employee Appointment Checklist';
                        RunObject = Page "Appointment Checklist";
                        RunPageLink = "Employee No." = FIELD("No.");
                    }

                    action(Terminate)
                    {
                        Caption = 'Terminate';

                        trigger OnAction()
                        begin
                            Status := Status::Terminated;
                            MODIFY;
                        end;
                    }

                    action("Employee Responsibilities")
                    {
                        Caption = 'Employee Responsibilities';
                        RunObject = Page "Employee Responsibilities";
                        RunPageLink = "No." = FIELD("No.");
                        Visible = false;
                    }

                    action("Emergency Contacts1")
                    {
                        Caption = 'Emergency Contacts';
                        RunObject = Page "Employee Emergency Contacts";
                        RunPageLink = "No." = FIELD("No.");
                    }
                    action("Alternative Addresses1")
                    {
                        Caption = 'Alternative Addresses';
                        RunObject = Page "Employee Aternative Addresses";
                        RunPageLink = "No." = FIELD("No.");
                    }
                    action("Next Of Kin1")
                    {
                        Caption = 'Next Of Kin';
                        RunObject = Page "Employee Kin";
                        RunPageLink = "No." = FIELD("No.");
                    }
                    action(Dependants1)
                    {
                        Caption = 'Dependants';
                        RunObject = Page "Employee Dependants";
                        RunPageLink = "No." = FIELD("No.");
                    }

                    action("Misc. Article Information")
                    {
                        Caption = 'Misc. Article Information';
                        RunObject = Page "Misc. Article Info.";
                        RunPageLink = "No." = FIELD("No.");
                    }
                    action("Medical Info.")
                    {
                        Caption = 'Medical Info.';
                        RunObject = Page "Employee Medical Information";
                        RunPageLink = "No." = FIELD("No.");
                    }

                    action(Unions)
                    {
                        Caption = 'Unions';
                        RunObject = Page Unions;
                        RunPageLink = Code = FIELD("No.");
                    }

                    action("Linked Documents")
                    {
                        Caption = 'Linked Documents';
                        RunObject = Page "Employee Linked Docs";
                        RunPageLink = "No." = FIELD("No.");
                    }

                    // action("A&bsences")
                    // {
                    //     Caption = 'A&bsences';
                    //     RunObject = Page "Capacity Absence";
                    //                     RunPageLink = "Capacity Type"=FIELD("No.");
                    // }

                    action("Succesion Planning & Requirements")
                    {
                        Caption = 'Succesion Planning & Requirements';
                        RunObject = Page "Succesion Planning";
                        RunPageLink = "No." = FIELD("No.");
                    }

                    action("Absences by Ca&tegories")
                    {
                        Caption = 'Absences by Ca&tegories';
                        RunObject = Page "Empl. Absences by Categories";
                    }
                    action("Misc. Articles &Overview")
                    {
                        Caption = 'Misc. Articles &Overview';
                        RunObject = Page "Misc. Articles Overview";
                    }

                    action("Separation Details")
                    {
                        Caption = 'Separation Details';
                        RunObject = Page Separation;
                        RunPageLink = "No." = FIELD("No.");
                    }

                    action("Membership Subscription")
                    {
                        Caption = 'Membership Subscription';
                        RunObject = Page "HR Professional Membership";
                    }
                    action("<Action1000000159>")
                    {
                        Caption = 'Employee List (All Employees)';
                        RunObject = Page "Employee List";
                        RunPageLink = "No." = FIELD("No.");
                        Visible = false;
                    }
                    //action("Employee Detail Summary View (Card)")
                    // {
                    //     Caption = 'Employee Detail Summary View (Card)';
                    //     Enabled = false;
                    //     RunObject = Page 51511137;
                    //                     Visible = false;
                    // }

                }
            }
            group("&Photograph")
            {
                Caption = '&Photograph';
                action(Import)
                {
                    Caption = 'Import';
                    Ellipsis = true;

                    trigger OnAction()
                    begin
                        PictureExists := Image.HASVALUE;
                        //IF Picture.IMPORT('*.bmp',TRUE) = '' THEN
                        //  EXIT;
                        IF PictureExists THEN
                            IF NOT CONFIRM('Do you want to replace the existing picture of %1 %2?', FALSE, TABLENAME, "No.") THEN
                                EXIT;
                        CurrPage.SAVERECORD;
                    end;
                }
                action("E&xport")
                {
                    Caption = 'E&xport';
                    Ellipsis = true;

                    trigger OnAction()
                    begin
                        //IF Picture.HASVALUE THEN
                        //  Picture.EXPORT('*.bmp',TRUE);
                    end;
                }
                action(Delete)
                {
                    Caption = 'Delete';

                    trigger OnAction()
                    begin
                        IF Image.HASVALUE THEN
                            IF CONFIRM('Do you want to delete the picture of %1 %2?', FALSE, TABLENAME, "No.") THEN BEGIN
                                CLEAR(Image);
                                CurrPage.SAVERECORD;
                            END;
                    end;
                }
            }
            group("Leave Manager")
            {
                Caption = 'Leave Manager';
                // action("Employee Leaves")
                // {
                //     Caption = 'Employee Leaves';
                //     RunObject = Page 51511388;
                //                     RunPageLink = "No."=FIELD("No.");
                // }
                action("Employee Off/Holidays Worked")
                {
                    Caption = 'Employee Off/Holidays Worked';
                    RunObject = Page "Employee Off/Holidays Worked";
                    RunPageLink = "No." = FIELD("No.");
                }
                action("Leave Application")
                {
                    Caption = 'Leave Application';
                    RunObject = Page "Leave Application Card";
                    RunPageLink = "Employee No" = FIELD("No.");
                }
                action("Leave Applications & Approval")
                {
                    Caption = 'Leave Applications & Approval';
                    RunObject = Page "Corporate Leave Plan";
                }
                action("Annual Leave Planner")
                {
                    Caption = 'Annual Leave Planner';
                    RunObject = Page "Corporate Leave Plan";
                }
                // action("Leave Types")
                // {
                //     Caption = 'Leave Types';
                //     RunObject = Page 51511390;
                // }
            }
            group(Disciplinary)
            {
                Caption = 'Disciplinary';
                action("Employee Disciplinary Cases")
                {
                    Caption = 'Employee Disciplinary Cases';
                    RunObject = Page "Employee Disciplinary Cases";
                    RunPageLink = "No." = FIELD("No.");
                }
                action("Other Incidents")
                {
                    Caption = 'Other Incidents';
                    RunObject = Page "Employee Other Incidents";
                    RunPageLink = "No." = FIELD("No.");
                }

                action("Disciplinary Case Ratings")
                {
                    Caption = 'Disciplinary Case Ratings';
                    RunObject = Page "Disciplinary Case Ratings";
                }
                action("Disciplinary Remarks")
                {
                    Caption = 'Disciplinary Remarks';
                    RunObject = Page "Disciplinary Remarks";
                }
                action("Disciplinary Cases")
                {
                    Caption = 'Disciplinary Cases';
                    RunObject = Page "Disciplinary Cases";
                }
                action("Disciplinary Actions")
                {
                    Caption = 'Disciplinary Actions';
                    RunObject = Page "Disciplinary Actions";
                }
            }
            group("Performance Management")
            {
                Caption = 'Performance Management';
                group("Performance Management1")
                {
                    Caption = 'Performance Management';
                    action("Appraisal Form")
                    {
                        Caption = 'Appraisal Form';
                        RunObject = Page "Appraisal Form";
                        RunPageLink = "Employee No" = FIELD("No.");
                    }

                    action("Appraisal Type")
                    {
                        Caption = 'Appraisal Type';
                        RunObject = Page "Appraisal Types";
                    }
                    action("Appraisal Periods")
                    {
                        Caption = 'Appraisal Periods';
                        RunObject = Page "Appraisal Periods";
                    }
                    action("Grade Matrix")
                    {
                        Caption = 'Grade Matrix';
                        RunObject = Page "Grade Matrix";
                    }
                }
            }
            group("Training Manager")
            {
                Caption = 'Training Manager';
                action("Training Requests")
                {
                    Caption = 'Training Requests';
                    RunObject = Page "Training Requests";
                    RunPageLink = "No." = FIELD("No.");
                }
                action(Training)
                {
                    Caption = 'Training';
                    RunObject = Page "Training Courses";
                    RunPageLink = "No." = FIELD("No.");
                }
                action("Training History")
                {
                    Caption = 'Training History';
                    RunObject = Page "Training History";
                    RunPageLink = "No." = FIELD("No.");
                }
                action("Existing Qualification")
                {
                    Caption = 'Existing Qualification';
                    RunObject = Page "Employee Qualification";
                    RunPageLink = "Employee No." = FIELD("No.");
                }
                // action("Education Assistance")
                // {
                //     Caption = 'Education Assistance';
                //     RunObject = Page 51511427;

                // }

                action("External Trainers")
                {
                    Caption = 'External Trainers';
                    RunObject = Page 27;
                }
            }
            group("Pay Manager")
            {
                Caption = 'Pay Manager';
                Visible = true;
                action("Pay Information")
                {
                    Caption = 'Pay Information';
                    RunObject = Page 5200;
                    RunPageLink = "No." = FIELD("No.");
                    Visible = true;
                }

                action("Create Imprest A/C")
                {
                    Caption = 'Create Imprest A/C';

                    trigger OnAction()
                    begin
                        CreateImprestAC(Rec);
                    end;
                }
                action("Account Mapping")
                {
                    Caption = 'Account Mapping';
                    RunObject = Page "Employee Account Mapping";
                    RunPageLink = "Employee No." = FIELD("No.");
                }
            }
            group("Medical ")
            {
                Caption = 'Medical ';
                Visible = false;
                action("Emergency Contacts")
                {
                    Caption = 'Emergency Contacts';
                    RunObject = Page "Employee Emergency Contacts";
                    RunPageLink = "No." = FIELD("No.");
                }
                action("Alternative Addresses")
                {
                    Caption = 'Alternative Addresses';
                    RunObject = Page "Employee Aternative Addresses";
                    RunPageLink = "No." = FIELD("No.");
                }
                action("Next Of Kin")
                {
                    Caption = 'Next Of Kin';
                    RunObject = Page "Employee Kin";
                    RunPageLink = "No." = FIELD("No.");
                }
                action(Dependants)
                {
                    Caption = 'Dependants';
                    RunObject = Page "Employee Dependants";
                    RunPageLink = "No." = FIELD("No.");
                }
            }
            group(Notification)
            {
                Caption = 'Notification';
                action("Notify New Staff")
                {
                    Caption = 'Notify New Staff';

                    trigger OnAction()
                    begin
                        TESTFIELD("No.");
                        TESTFIELD("E-Mail");

                        UserSetup.RESET;
                        UserSetup.SETRANGE(UserSetup."Employee No.", "No.");
                        IF NOT UserSetup.FIND('-') THEN
                            ERROR('A domain user account has not been created in the system for Employee No %1. Ensure that that a valid user account has been created and mapped to the Employee No.', "No.");


                        UserSetup.RESET;
                        IF UserSetup.GET(USERID) THEN BEGIN
                            SenderAddress := UserSetup."E-Mail";
                            IF Employee.GET(UserSetup."Employee No.") THEN
                                SenderName := Employee."First Name" + ' ' + Employee."Middle Name" + ' ' + Employee."Last Name";
                        END;

                        UserSetup.RESET;
                        UserSetup.SETRANGE(UserSetup."Employee No.", "No.");
                        IF UserSetup.FIND('-') THEN BEGIN
                            IF UserSetup2.GET(UserSetup.HOD) THEN
                                HODEmail := UserSetup2."E-Mail";
                        END;

                        Recipients := "E-Mail";
                        Subject := 'Staff Member Account Notification';
                        Body := STRSUBSTNO('This is to notify you that a Staff Member Profile has been created as Employee No %1 for %2 %3 %4 with Job Title %5', "No.", "First Name", "Middle Name", "Last Name", "Job Title");
                        SMTPSetup.Create(Recipients, Subject, Body, TRUE);
                        //SMTPSetup.AddCC(HODEmail);
                        Email.Send(SMTPSetup);
                    end;
                }
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        DAge := '';
        DService := '';
        DPension := '';
        DMedical := '';

        //Recalculate Important Dates
        IF ("Date Of Leaving" = 0D) THEN BEGIN
            IF ("Date Of Birth" <> 0D) THEN
                DAge := Dates.DetermineAge("Date Of Birth", TODAY);
            IF ("Date Of Join" <> 0D) THEN
                DService := Dates.DetermineAge("Date Of Join", TODAY);
            IF ("Pension Scheme Join" <> 0D) THEN
                DPension := Dates.DetermineAge("Pension Scheme Join", TODAY);
            IF ("Medical Scheme Join" <> 0D) THEN
                DMedical := Dates.DetermineAge("Medical Scheme Join", TODAY);
            //MODIFY;
        END ELSE BEGIN
            IF ("Date Of Birth" <> 0D) THEN
                DAge := Dates.DetermineAge("Date Of Birth", "Date Of Leaving");
            IF ("Date Of Join" <> 0D) THEN
                DService := Dates.DetermineAge("Date Of Join", "Date Of Leaving");
            IF ("Pension Scheme Join" <> 0D) THEN
                DPension := Dates.DetermineAge("Pension Scheme Join", "Date Of Leaving");
            IF ("Medical Scheme Join" <> 0D) THEN
                DMedical := Dates.DetermineAge("Medical Scheme Join", "Date Of Leaving");
            //MODIFY;
        END;
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        "Pays tax" := TRUE;

        RESET;
        "gOpt Active" := "gOpt Active"::All;
        MESSAGE('All employee information must be completed.')
    end;

    trigger OnOpenPage()
    begin
        "gOpt Active" := "gOpt Active"::All;
        SETCURRENTKEY("Termination Category");
        "Filter Employees"(2);
        DAge := '';
        DService := '';
        DPension := '';
        DMedical := '';

        //Recalculate Important Dates
        IF ("Date Of Leaving" = 0D) THEN BEGIN
            IF ("Date Of Birth" <> 0D) THEN
                DAge := Dates.DetermineAge("Date Of Birth", TODAY);
            IF ("Date Of Join" <> 0D) THEN
                DService := Dates.DetermineAge("Date Of Join", TODAY);
            IF ("Pension Scheme Join" <> 0D) THEN
                DPension := Dates.DetermineAge("Pension Scheme Join", TODAY);
            IF ("Medical Scheme Join" <> 0D) THEN
                DMedical := Dates.DetermineAge("Medical Scheme Join", TODAY);
            //MODIFY;
        END ELSE BEGIN
            IF ("Date Of Birth" <> 0D) THEN
                DAge := Dates.DetermineAge("Date Of Birth", "Date Of Leaving");
            IF ("Date Of Join" <> 0D) THEN
                DService := Dates.DetermineAge("Date Of Join", "Date Of Leaving");
            IF ("Pension Scheme Join" <> 0D) THEN
                DPension := Dates.DetermineAge("Pension Scheme Join", "Date Of Leaving");
            IF ("Medical Scheme Join" <> 0D) THEN
                DMedical := Dates.DetermineAge("Medical Scheme Join", "Date Of Leaving");
            //MODIFY;
        END;

        HRSetup.GET;
        IF ("Date Of Birth" <> 0D) THEN
            "Retirement Date" := CALCDATE(HRSetup."Retirement Age", "Date Of Birth");
    end;

    var
        Mail: Codeunit 397;
        PictureExists: Boolean;
        Dates: Codeunit "HR Dates";
        D: Date;
        DAge: Text[100];
        DService: Text[100];
        DPension: Text[100];
        DMedical: Text[100];
        "gOpt Active": Option Active,Archive,All;
        HRSetup: Record 5218;
        Link: Text[250];
        SMTPSetup: Codeunit "Email Message";
        Email: Codeunit Email;
        SenderName: Text[50];
        SenderAddress: Text[80];
        Recipients: Text[80];
        Subject: Text[150];
        Body: Text[250];
        UserSetup: Record 91;
        Employee: Record 5200;
        HODEmail: Text[80];
        UserSetup2: Record 91;

    procedure "Filter Employees"(Type: Option Active,Archive,All)
    begin

        IF Type = Type::Active THEN BEGIN
            RESET;
            SETFILTER("Termination Category", '=%1', "Termination Category"::" ");
        END
        ELSE
            IF Type = Type::Archive THEN BEGIN
                RESET;
                SETFILTER("Termination Category", '>%1', "Termination Category"::" ");
            END
            ELSE
                IF Type = Type::All THEN
                    RESET;

        CurrPage.UPDATE(FALSE);
        FILTERGROUP(20);
    end;

    local procedure AllgOptActiveOnPush()
    begin
        "Filter Employees"(2); //  Show All Employees
    end;

    local procedure ArchivegOptActiveOnPush()
    begin
        "Filter Employees"(1); //Archived Employees
    end;

    local procedure ActivegOptActiveOnPush()
    begin
        "Filter Employees"(0); //Active Employees
    end;

    local procedure ActivegOptActiveOnValidate()
    begin
        ActivegOptActiveOnPush;
    end;

    local procedure ArchivegOptActiveOnValidate()
    begin
        ArchivegOptActiveOnPush;
    end;

    local procedure AllgOptActiveOnValidate()
    begin
        AllgOptActiveOnPush;
    end;
}

