Page 52193505 "Maintenance Request Resolution"
{
    PageType = Card;
    SourceTable = "User Support Incidences1";
    SourceTableView = where(Category = const(Maintenance));

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'Incident Tracking';
                field(IncidentReference; "Incident Reference")
                {
                    ApplicationArea = Basic;
                }
                field(IncidentDescription; "Incident Description")
                {
                    ApplicationArea = Basic;
                }
                field(IncidentDate; "Incident Date")
                {
                    ApplicationArea = Basic;
                }
                field(EmployeeNo; "Employee No")
                {
                    ApplicationArea = Basic;
                }
                field(EmployeeName; "Employee Name")
                {
                    ApplicationArea = Basic;
                }
                field(User; User)
                {
                    ApplicationArea = Basic;
                }
                field(UseremailAddress; "User email Address")
                {
                    ApplicationArea = Basic;
                }
                field(IncidenceLocationName; "Incidence Location Name")
                {
                    ApplicationArea = Basic;
                }
            }
            group(IncidentResolution)
            {
                Caption = 'Incident Resolution';
                field(RemarksHR; "Remarks HR")
                {
                    ApplicationArea = Basic;
                }
                field(SystemSupportEmailAddress; "System Support Email Address")
                {
                    ApplicationArea = Basic;
                }
                field(Actiontaken; "Action taken")
                {
                    ApplicationArea = Basic;
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
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            action(InformUserofResolution)
            {
                ApplicationArea = Basic;
                Caption = 'Inform User of Resolution';

                trigger OnAction()
                begin
                    Rec.TestField("Incident Status");
                    Rec.TestField("Action taken");
                    Rec.TestField("Action Date");
                    Rec.TestField("Incident Status");




                    //Mail.ResolvedIncidentMail("User email Address","Incident Reference","Action taken");
                    if "User Informed?" = true then
                        Error('You have already informed the user!!')
                    else begin
                        Users.Reset;
                        Users.SetRange(Users."Employee No.", "Work place Controller");
                        if Users.Find('-') then begin
                            WCEmail := Users."E-Mail";
                        end;

                        SenderName := UserId;
                        SenderAddress := "System Support Email Address";

                        SMTPSetup.Create("User email Address", "Incident Reference", "Action taken", true);
                        //SMTPSetup.AddCC(WCEmail);
                        Email.Send(SMTPSetup);

                        "User Informed?" := true;
                        Rec.Modify;
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
        Category := Category::Maintenance;
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Type := Type::ICT;
        User := UserId;
        Users.Get(UserId);
        "User email Address" := Users."E-Mail";
        //  "Employee No":=Users."Employee No.";
        //   emp.GET("Employee No");
        //   "Employee Name":=emp."First Name"+' '+emp."Last Name";
        compinfo.Get;
        //"System Support Email Address":=compinfo."Sytem Support Email Address";
        //INSERT;
        Category := Category::Maintenance;
    end;

    var
        Users: Record "User Setup";
        compinfo: Record "Company Information";
        WCEmail: Text[80];
        SenderName: Text[50];
        SenderAddress: Text[80];
        SMTPSetup: Codeunit "Email Message";
        Email: Codeunit Email;
}
