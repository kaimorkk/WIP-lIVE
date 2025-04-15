Page 52193468 "My Employee List"
{
    CardPageID = "HR Employee";
    PageType = List;
    SourceTable = Employee;

    layout
    {
        area(content)
        {
            repeater(Control1000000000)
            {
                field(No; "No.")
                {
                    ApplicationArea = Basic;
                }
                field(FirstName; "First Name")
                {
                    ApplicationArea = Basic;
                }
                field(MiddleName; "Middle Name")
                {
                    ApplicationArea = Basic;
                }
                field(LastName; "Last Name")
                {
                    ApplicationArea = Basic;
                }
                field(JobTitle; "Job Title")
                {
                    ApplicationArea = Basic;
                }
                field(Status; Status)
                {
                    ApplicationArea = Basic;
                }
                field(Title; Title)
                {
                    ApplicationArea = Basic;
                }
                field(Gender; Gender)
                {
                    ApplicationArea = Basic;
                }
                field(Citizenship; Citizenship)
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
            action("Create Imprest A/C")
            {
                ApplicationArea = Basic;

                trigger OnAction()
                var
                    EmpRec: Record Employee;
                begin
                    if Confirm(Text000, false) then begin
                        CurrPage.SetSelectionFilter(EmpRec);
                        if EmpRec.Find('-') then
                            repeat
                            // CreateImprestAC(EmpRec);
                            until
                             EmpRec.Next = 0;
                    end;
                end;
            }
        }
    }

    var
        Text000: label 'Are you sure you want to Create Imprest Account''s for the selected employees?';
}

