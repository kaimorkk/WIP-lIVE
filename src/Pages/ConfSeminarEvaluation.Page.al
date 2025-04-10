Page 52194170 "Conf/Seminar Evaluation"
{
    PageType = Card;
    SourceTable = "Conf/Sem/WS Evaluation1";

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field(No; "No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(EmployeeNo; "Employee No")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Designation; Designation)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(SelectTraining; "Request No")
                {
                    ApplicationArea = Basic;
                    Caption = 'Select Training ';
                }
                field(Insitution; Insitution)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(From; "Planned Start Date")
                {
                    ApplicationArea = Basic;
                    Caption = 'From';
                    Editable = false;
                }
                group(EventFeedback)
                {
                    Caption = 'Event Feedback';
                    field(IssuesDiscussed1; "Issues Discussed 1")
                    {
                        ApplicationArea = Basic;
                    }
                    field(IssuesDiscussed2; "Issues Discussed 2")
                    {
                        ApplicationArea = Basic;
                    }
                    field(IssuesDiscussed3; "Issues Discussed 3")
                    {
                        ApplicationArea = Basic;
                    }
                    field(IssuesDiscussed4; "Issues Discussed 4")
                    {
                        ApplicationArea = Basic;
                    }
                    label(Control1000000047)
                    {
                        ApplicationArea = Basic;
                        CaptionClass = Text19020914;
                    }
                    label(Control1000000056)
                    {
                        ApplicationArea = Basic;
                        CaptionClass = Text19026411;
                    }
                    field("1"; "Difficult 1")
                    {
                        ApplicationArea = Basic;
                        Caption = '1';
                    }
                    field("2"; "Difficult 2")
                    {
                        ApplicationArea = Basic;
                        Caption = '2';
                    }
                    label(Control1000000057)
                    {
                        ApplicationArea = Basic;
                        CaptionClass = Text19017898;
                    }
                }
                field(FollowUp1; "Follow Up 1")
                {
                    ApplicationArea = Basic;
                    Caption = '1';
                }
                field(FollowUp2; "Follow Up 2")
                {
                    ApplicationArea = Basic;
                    Caption = '2';
                }
                field(Suggestion1; "Suggestion 1")
                {
                    ApplicationArea = Basic;
                    Caption = '1';
                }
                field(Suggestion2; "Suggestion 2")
                {
                    ApplicationArea = Basic;
                    Caption = '2';
                }
                field(EvaluationDate; "Evaluation  Date")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(EmployeeName; "Employee Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Description; Description)
                {
                    ApplicationArea = Basic;
                    Caption = 'Course Title';
                    Editable = false;
                }
                field("To"; "Planned End Date")
                {
                    ApplicationArea = Basic;
                    Caption = 'To';
                    Editable = false;
                }
                field(DepartmentCode; "Department Code")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Venue; Venue)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(NoOfDays; "No. Of Days")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action(Submit)
            {
                ApplicationArea = Basic;
                Caption = 'OK';

                trigger OnAction()
                begin
                    Message('Submitted successfully');

                    /*   CCName:='';
                     CName:='';
                 IF FINDSET THEN REPEAT

                 Subject:='Evaluation form' ;
                 Body:="Employee Name"+' Has just submitted seminar evaluation form  regarding '+"Course Title" ;

                 CName:='hrgrp@erc.go.ke';
                 //CName:='isaac.kiplagat@gmail.com';
                 //E-mail the files
                 //PrequalifiedSupRec.RESET;
                 //PrequalifiedSupRec.SETRANGE(PrequalifiedSupRec.Name,SupplierSelect."Supplier Name");
                 //IF  PrequalifiedSupRec.FIND('-') THEN
                 Mail.CreateMessage(CName,CCName,Subject,Body,'',FALSE);
                 IF MailSent THEN
                 // MailSent:=Mail.Send()
                 MESSAGE('Submitted')
                  ELSE
                     MailSent := Mail.Send();
                   UNTIL  Rec.NEXT=0;*/

                end;
            }
            action(Print)
            {
                ApplicationArea = Basic;
                Caption = 'Print';
                Image = Print;
                Visible = false;

                trigger OnAction()
                begin
                    Reset;
                    SetFilter("No.", "No.");
                    Report.Run(51511195, true, true, Rec);
                    Reset;
                end;
            }
        }
        area(Promoted)
        {
            group(Category_Process)
            {
                actionref(Submit_Promoted; Submit)
                {
                }
                actionref(Print_Promoted; Print)
                {
                }
            }
        }
    }

    trigger OnOpenPage()
    begin
        "User ID" := UserId;
    end;

    var
        Mail: Codeunit Mail;
        MailSent: Boolean;
        Subject: Text[250];
        Body: Text[250];
        CCName: Text[30];
        empl: Record Employee;
        CName: Text[30];
        usersetup: Record "User Setup";
        Text19020914: label 'What are the possible areas of follow up for ERC';
        Text19026411: label 'What difficulties did you experience prior and during the conference';
        Text19017898: label 'Give suggestions on how the difficulties enumerated above can be tackled by ERC';
}

