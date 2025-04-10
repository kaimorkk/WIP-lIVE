

page 69708 "Created Vacancies"
{
    CardPageID = Vacancy;
    PageType = List;
    SourceTable = "Recruitment Requisition Header";
    SourceTableView = where("Document Type" = filter("Job Vacancy"),
                            Published = filter(false));
    UsageCategory = Documents;
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Document No."; Rec."Document No.")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document No. field.';
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document Date field.';
                }
                field("Recruitment Plan ID"; Rec."Recruitment Plan ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Recruitment Plan ID field.';
                }
                field("Recruitment Plan Type"; Rec."Recruitment Plan Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Recruitment Plan Type field.';
                }
                field("Position ID"; Rec."Position ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Position ID field.';
                }
                field("Job Title/Designation"; Rec."Job Title/Designation")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Job Title/Designation field.';
                }
                field("Requester ID"; Rec."Requester ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Requester ID field.';
                }
                field("Requester Staff No"; Rec."Requester Staff No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Requester Staff No field.';
                }
                field("Requester Name"; Rec."Requester Name")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Requester Name field.';
                }
                field(Directorate; Rec.Directorate)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Directorate field.';
                }
                field(Department; Rec.Department)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Department field.';
                }
                field(Region; Rec.Region)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Region field.';
                }
                field("Finacial Year Code"; Rec."Finacial Year Code")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Finacial Year Code field.';
                }
                field("Approval Status"; Rec."Approval Status")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Approval Status field.';
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Created By field.';
                }
                field("Created On"; Rec."Created On")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Created On field.';
                }
                field("Created Time"; Rec."Created Time")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Created Time field.';
                }
            }
        }
        area(factboxes)
        {
            systempart(Control20; Outlook)
            {
                ApplicationArea = Basic;
            }
            systempart(Control21; Notes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control22; MyNotes)
            {
                ApplicationArea = Basic;
            }
            systempart(Control23; Links)
            {
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

