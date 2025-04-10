report 50001 "Processing Only"
{
    ApplicationArea = All;
    Caption = 'Processing Only';
    UsageCategory = Tasks;
    ProcessingOnly = true;

    dataset
    {
        dataitem("User Setup";"User Setup")
        {
            trigger OnAfterGetRecord()
            var
                Emp: Record Employee;
            begin
                Emp.Reset();
                Emp.SetRange("No.", "User Setup"."Employee No.");
                if Emp.Find() then begin
                    "User Setup"."Employee Name" := Emp.FullName();
                    "User Setup".Modify();
                end;
            end;
        }
    }
    requestpage
    {
        layout
        {
            area(Content)
            {
                group(GroupName)
                {
                }
            }
        }
        actions
        {
            area(Processing)
            {
            }
        }
    }
}
