Page 52193820 "Books Request"
{
    PageType = Card;
    SourceTable = "Book Issue1";
    SourceTableView = where(Requested=const(false));

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field(RequestNo;"Request No.")
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
                field(Employeename;"Employee Name")
                {
                    ApplicationArea = Basic;
                    Caption = 'Employee name';
                    Editable = false;
                }
                field(RequestDate;"Request Date")
                {
                    ApplicationArea = Basic;
                }
                field(CompanyEmailAddress;"System Support Email Address")
                {
                    ApplicationArea = Basic;
                    Caption = 'Company  E-mail Address';
                }
            }
            part(Control1000000010;"Books Request Details")
            {
                SubPageLink = "Request No"=field("Request No.");
            }
        }
    }

    actions
    {
        area(processing)
        {
            action(SendRequest)
            {
                ApplicationArea = Basic;
                Caption = 'Send Request';
                //RunObject = Page "PR NHIF Setup";
                //RunPageLink = "NHIF Tier"=field("Request No.");

                trigger OnAction()
                begin
                     TestField("Employee No");
                     TestField("Request Date");

                     BreqDetails.Reset;
                     BreqDetails.SetRange(BreqDetails."Request No","Request No.");
                     if BreqDetails.FindLast=false then
                     Error('Please fill in the books/publication details');


                    Requested:=true;
                    Modify;
                    //Detail:="Employee Name"+' '+text1+"Request No.";
                    //Mail.NewIncidentMail("System Support Email Address","Request No.",Detail);
                end;
            }
        }
        area(Promoted)
        {
            group(Category_Process)
            {
                actionref(SendRequest_Promoted; SendRequest)
                {
                }
            }
        }
    }

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
          CompInfo.Get;
        //  "System Support Email Address":=CompInfo."Registry Email";
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        //  CompInfo.GET;
         // "System Support Email Address":=CompInfo."Registry Email";
        User:=UserId;
        Requested:=false;
        "Request Date":=Today;
    end;

    trigger OnOpenPage()
    begin
        SetRange(User,UserId);
    end;

    var
        Mail: Codeunit Mail;
        CompInfo: Record "Company Information";
        text1: label 'Has requested books in Requisition No.';
        Detail: Text[100];
        BreqDetails: Record "Book Issue Details1";
        Bkissues: Record "Book Issue1";
}

