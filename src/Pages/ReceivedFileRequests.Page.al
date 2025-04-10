Page 52193790 "Received File Requests"
{
    ApplicationArea = Basic;
    Editable = false;
    PageType = Card;
    SourceTable = "File Requests1";
    SourceTableView = where("Send Status"=const(true));
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
            action(IssueFile)
            {
                ApplicationArea = Basic;
                Caption = 'Issue File';
                RunObject = Page "File batch";
                RunPageLink = "Request No"=field("Request No");
            }
        }
        area(Promoted)
        {
            group(Category_Process)
            {
                actionref(IssueFile_Promoted; IssueFile)
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

    var
        Mail: Codeunit Mail;
        CompInfo: Record "Company Information";
        FileReq: Text[250];
        Text1: label 'is being requested by:';
        Text19055830: label 'Files Requested';
}

