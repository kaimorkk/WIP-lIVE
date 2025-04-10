Page 50018 "HOD Leave Recalls List"
{
    ApplicationArea = Basic;
    CardPageID = "Leave Recall";
    PageType = List;
    SourceTable = "Employee Off/Holidays1";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                field(No;"No.")
                {
                    ApplicationArea = Basic;
                }
                field(Date;Date)
                {
                    ApplicationArea = Basic;
                }
                field(RecallDate;"Recall Date")
                {
                    ApplicationArea = Basic;
                }
                field(RecalledBy;"Recalled By")
                {
                    ApplicationArea = Basic;
                }
                field(ReasonforRecall;"Reason for Recall")
                {
                    ApplicationArea = Basic;
                }
                field(RecalledFrom;"Recalled From")
                {
                    ApplicationArea = Basic;
                }
                field(RecalledTo;"Recalled To")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
    }

    trigger OnOpenPage()
    begin
        UserRec.Reset;
        if UserRec.Get(UserId) then
        // Emp.RESET;
         if Emp.Get(UserRec."Employee No.") then begin
           SetRange("Directorate Code",Emp."Global Dimension 1 Code");
           SetRange("Department Name",Emp."Global Dimension 2 Code");
         end;
    end;

    var
        UserRec: Record "User Setup";
        Emp: Record Employee;
}

