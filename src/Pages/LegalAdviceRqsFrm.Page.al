Page 52193799 "Legal Advice Rqs Frm"
{
    PageType = Card;
    SourceTable = "Legal Advice1";
    SourceTableView = where(Status=const(Open));

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field(RequestID;"Request ID")
                {
                    ApplicationArea = Basic;
                    Editable = true;
                    Enabled = true;
                }
                field(EmployeeId;"Employee Id")
                {
                    ApplicationArea = Basic;
                }
                field(EmployeeName;"Employee Name")
                {
                    ApplicationArea = Basic;
                }
                field(Department;Department)
                {
                    ApplicationArea = Basic;
                }
                field(RequestTitle;"Request Title")
                {
                    ApplicationArea = Basic;
                }
                field(RequestDescription;"Request Description")
                {
                    ApplicationArea = Basic;
                }
                field(RequestDate;"Request Date")
                {
                    ApplicationArea = Basic;
                }
                field(Status;Status)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(RequestClosureDate;"Request Closure Date")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Attachement;Attachement)
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Send Request")
            {
                ApplicationArea = Basic;
                Caption = 'Send Request';

                trigger OnAction()
                begin

                    TestField("Request Description");
                    TestField("Employee Id");
                    TestField(Department);
                    //TESTFIELD("User Email");
                    if Status<>Status::Open  then
                    Error('You have already been send by the user!!')
                      else begin

                     //Mail.NewIncidentMail(compinfo."CS Email","Request ID","Request Description");
                    Status:=Status::"Pending Approval";
                    Modify;

                    Message('Request Submitted')

                     end;
                end;
            }
        }
        area(Promoted)
        {
            group(Category_Process)
            {
                actionref("Send Request_Promoted"; "Send Request")
                {
                }
            }
        }
    }

    trigger OnInsertRecord(BelowxRec: Boolean): Boolean
    begin
        compinfo.Get;
        "Legal Person Email":=compinfo."CS Email";

                  Status:=Status::Open;
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin

        User:=UserId;
        Users.Get(UserId);
        "User Email":=Users."E-Mail";
             "Employee Id":=Users."Employee No.";
            emp.Get("Employee Id");
             "Employee Name":=emp."First Name"+' '+emp."Last Name";
           Dimension.Get('DEPARTMENT', emp."Global Dimension 1 Code");

           Department:=Dimension.Name;

        compinfo.Get;
        "Legal Person Email":=compinfo."CS Email";



                  Status:=Status::Open;
    end;

    var
        Mail: Codeunit Mail;
        compinfo: Record "Company Information";
        Users: Record "User Setup";
        emp: Record Employee;
        Dimension: Record "Dimension Value";
}

