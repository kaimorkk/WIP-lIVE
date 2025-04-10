
page 75428 "Sub Functional Disposal plans"
{
    Caption = 'Submitted Functional Disposal plans';
    CardPageID = "Functional Disposal Plan";
    PageType = List;
    SourceTable = "Annual Disposal plan Header";
    SourceTableView = where("Disposal Catetory" = const("Functional Disposal"),
                            "Document Status" = const(Submitted));

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(No; Rec.No)
                {
                    ApplicationArea = Basic;
                }
                field(StartDate; Rec."Start Date")
                {
                    ApplicationArea = Basic;
                }
                field(EndDate; Rec."End Date")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field(CreatedBy; Rec."Created By")
                {
                    ApplicationArea = Basic;
                }
                field(DateCreated; Rec."Date Created")
                {
                    ApplicationArea = Basic;
                }
                field(TimeCreated; Rec."Time Created")
                {
                    ApplicationArea = Basic;
                }
                field(DepartmentFilter; Rec."Department Filter")
                {
                    ApplicationArea = Basic;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = Basic;
                }
            }
        }
        area(factboxes)
        {
            systempart(Control13; Outlook)
            {
                ApplicationArea = All;
            }
            systempart(Control14; Notes)
            {
                ApplicationArea = All;
            }
            systempart(Control15; MyNotes)
            {
                ApplicationArea = All;
            }
            systempart(Control16; Links)
            {
                ApplicationArea = All;
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

