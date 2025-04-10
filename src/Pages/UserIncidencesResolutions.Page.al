Page 52193829 "User Incidences Resolutions"
{
    PageType = Card;
    SourceTable = "User Support Incidences1";

    layout
    {
        area(content)
        {
            group(IncidentTracking)
            {
                Caption = 'Incident Tracking';
                field(IncidentReference; "Incident Reference")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(IncidentDescription; "Incident Description")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    MultiLine = true;
                }
                field(IncidentDate; "Incident Date")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(EmployeeNo; "Employee No")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(EmployeeName; "Employee Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(User; User)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(UseremailAddress; "User email Address")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(IncidenceLocationName; "Incidence Location Name")
                {
                    ApplicationArea = Basic;
                }
            }
            group(IncidentResolution)
            {
                Caption = 'Incident Resolution';
                label(Control1000000030)
                {
                    ApplicationArea = Basic;
                    CaptionClass = Text19050240;
                    Style = Strong;
                    StyleExpr = true;
                }
                field(RemarksHR; "Remarks HR")
                {
                    ApplicationArea = Basic;
                }
                field(SystemSupportEmailAddress; "System Support Email Address")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                    Enabled = true;
                }
                field(ActionDate; "Action Date")
                {
                    ApplicationArea = Basic;
                }
                field(IncidentStatus; "Incident Status")
                {
                    ApplicationArea = Basic;
                }
                field(UserInformed; "User Informed?")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                group(ChairmanIncidenceCommitteeRemarks)
                {
                    Caption = 'Chairman Incidence Committee Remarks';
                    field(Actiontaken; "Action taken")
                    {
                        ApplicationArea = Basic;
                        Editable = true;
                    }
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action(InformUserofResolution)
            {
                ApplicationArea = Basic;
                Caption = 'Inform User of Resolution';

                trigger OnAction()
                begin
                    TestField("Incident Status");
                    TestField("Action taken");
                    TestField("Action Date");
                    TestField("Incident Status");




                    //Mail.ResolvedIncidentMail("User email Address","Incident Reference","Action taken");
                    if "User Informed?" = true then
                        Error('You have already informed the user!!')
                    else begin
                        Users.Reset;
                        Users.SetRange(Users."Employee No.", "Work place Controller");
                        if Users.Find('-') then begin
                            WCEmail := Users."E-Mail";
                        end;

                        SenderName := "Employee Name";
                        SenderAddress := "System Support Email Address";

                        SMTPSetup.Create("User email Address", "Incident Reference", "Action taken", true);
                        //SMTPSetup.AddCC(WCEmail);
                        Email.Send(SMTPSetup);

                        "User Informed?" := true;
                        Modify;
                        Message('Message sent successfully');
                    end;
                end;
            }
        }
        area(Promoted)
        {
            group(Category_Process)
            {
                actionref(InformUserofResolution_Promoted; InformUserofResolution)
                {
                }
            }
        }
    }

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        Type := Type::ICT;
        compinfo.Get;
        "System Support Email Address" := compinfo."E-Mail";
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Type := Type::ICT;
        compinfo.Get;
        "System Support Email Address" := compinfo."E-Mail";
        //INSERT;
    end;

    var
        Mail: Codeunit Mail;
        compinfo: Record "Company Information";
        Text19050240: label 'HR Remarks';
        Users: Record "User Setup";
        SMTPSetup: Codeunit "Email Message";
        Email: Codeunit Email;
        WCEmail: Text[80];
        SenderName: Text[50];
        SenderAddress: Text[80];
}

