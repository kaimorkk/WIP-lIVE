Page 52194274 "GS Legal Advice Rqsts List"
{
    CardPageID = "Legal Advice Rqs Frm";
    PageType = List;
    SourceTable = "Legal Advice1";
    SourceTableView = where(Status=const(Open));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(RequestID;"Request ID")
                {
                    ApplicationArea = Basic;
                }
                field(RequestDescription;"Request Description")
                {
                    ApplicationArea = Basic;
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
                field(RequestDate;"Request Date")
                {
                    ApplicationArea = Basic;
                }
                field(Status;Status)
                {
                    ApplicationArea = Basic;
                }
                field(RequestClosureDate;"Request Closure Date")
                {
                    ApplicationArea = Basic;
                }
                field(RequestTitle;"Request Title")
                {
                    ApplicationArea = Basic;
                }
                field(Advice;Advice)
                {
                    ApplicationArea = Basic;
                }
                field(NoSeries;"No. Series")
                {
                    ApplicationArea = Basic;
                }
                field(User;User)
                {
                    ApplicationArea = Basic;
                }
                field(LegalPersonID;"Legal Person ID")
                {
                    ApplicationArea = Basic;
                }
                field(LegalPersonEmail;"Legal Person Email")
                {
                    ApplicationArea = Basic;
                }
                field(UserEmail;"User Email")
                {
                    ApplicationArea = Basic;
                }
                field(Attachement;Attachement)
                {
                    ApplicationArea = Basic;
                }
                field(LanguageCodeDefault;"Language Code(Default)")
                {
                    ApplicationArea = Basic;
                }
                field(RequestType;"Request Type")
                {
                    ApplicationArea = Basic;
                }
                field(Reason;Reason)
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
    }

    var
        Mail: Codeunit Mail;
        compinfo: Record "Company Information";
        Users: Record "User Setup";
        emp: Record Employee;
        Dimension: Record "Dimension Value";
}

