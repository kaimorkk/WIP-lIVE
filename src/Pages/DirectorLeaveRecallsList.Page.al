Page 50064 "Director Leave Recalls List"
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
         if Emp.Get(UserRec."Employee No.") then
           SetRange("Directorate Code",Emp."Global Dimension 1 Code");
    end;

    var
        UserRec: Record "User Setup";
        Emp: Record Employee;
}

