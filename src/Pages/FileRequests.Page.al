Page 52193789 "File Requests"
{
    ApplicationArea = Basic;
    PageType = Card;
    SourceTable = "File Requests1";
    SourceTableView = where("Send Status"=const(false));
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field(RequestNo;"Request No")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(User;User)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(EmployeeNo;"Employee No")
                {
                    ApplicationArea = Basic;
                }
                field(EmployeeName;"Employee Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Date;Date)
                {
                    ApplicationArea = Basic;
                }
                field(Time;Time)
                {
                    ApplicationArea = Basic;
                }
            }
            label(Control1000000016)
            {
                ApplicationArea = Basic;
                CaptionClass = Text19055830;
                Style = Strong;
                StyleExpr = true;
            }
            part(Control1000000006;"File Batch details")
            {
                SubPageLink = "Request No"=field("Request No");
            }
        }
    }

    actions
    {
        area(processing)
        {
            action(SendToRegisty)
            {
                ApplicationArea = Basic;
                Caption = 'Send To  Registy';

                trigger OnAction()
                begin
                    TestField("Employee No");
                    TestField(Date);
                    TestField(Time);
                    
                    FileBatch.Reset;
                    FileBatch.SetRange(FileBatch."Request No","Request No");
                    
                    if FileBatch.FindLast=false then
                    Error('Please fill in the files that you are requesting!!!');
                    
                    
                    FileReq:="Employee Name"+' '+'PF No:'+"Employee No"+' '+'has requested files in File requisition No:'+"Request No";
                    //Mail.NewIncidentMail("System Support Email Address","Incident Reference","Incident Description");
                    /* Mail.NewIncidentMail("System Support Email Address","Request No",FileReq);*/
                    "Send Status":=true;
                    Modify;

                end;
            }
        }
        area(Promoted)
        {
            group(Category_Process)
            {
                actionref(SendToRegisty_Promoted; SendToRegisty)
                {
                }
            }
        }
    }

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        CompInfo.Get;
        //"System Support Email Address":=CompInfo."Registry Email";
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        CompInfo.Get;
        //"System Support Email Address":=CompInfo."Registry Email";
    end;

    trigger OnOpenPage()
    begin
            SetRange(User,UserId);
    end;

    var
        Mail: Codeunit Mail;
        CompInfo: Record "Company Information";
        FileReq: Text[250];
        Text1: label 'is being requested by:';
        FileBatch: Record "File Batch Requests1";
        Text19055830: label 'Files Requested';
}

