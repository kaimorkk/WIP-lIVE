
page 51002 "All Published  Vacancies List"
{
    CardPageID = Vacancy;
    InsertAllowed = false;
    PageType = List;
    SourceTable = "Recruitment Requisition Header";
    SourceTableView = where("Document Type" = const("Job Vacancy"),
                            "Approval Status" = const(Released));
    UsageCategory = History;
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Document No."; "Document No.")
                {
                    ApplicationArea = Basic;
                }
                field("Position ID"; "Position ID")
                {
                    ApplicationArea = Basic;
                }
                field("Job Title/Designation"; Rec."Job Title/Designation")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Job Title/Designation field.';
                }
                field("Approval Status"; "Approval Status")
                {
                    ApplicationArea = Basic;
                }
                field("No. of Applications"; "No. of Applications")
                {
                    ApplicationArea = Basic;
                }
                field(Published; Published)
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control41; Outlook)
            {
                ApplicationArea = All;
            }
            systempart(Control42; Notes)
            {
                ApplicationArea = All;
            }
            systempart(Control43; MyNotes)
            {
                ApplicationArea = All;
            }
            systempart(Control44; Links)
            {
                ApplicationArea = All;
            }
        }
    }

    actions
    {
    }
}

