

page 75105 "Project Staff Template Line"
{
    PageType = ListPart;
    SourceTable = "Project Staff Template Line";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Project Role Code"; Rec."Project Role Code")
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    Caption = 'Title Designation Description';
                }
                field("Staff Category"; Rec."Staff Category")
                {
                    ApplicationArea = Basic;
                }
                field("Min No. of Recomm Staff"; Rec."Min No. of Recomm Staff")
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
            group(Line)
            {
                Caption = 'Line';
                action("Project Staff Template Exp")
                {
                    ApplicationArea = Basic;
                    Caption = 'Required Qualification';
                    Image = PlanningWorksheet;
                    RunObject = Page "Project Staff Template Exp";
                    RunPageLink = "Key Staff Template ID" = field("Key Staff Template ID"),
                                  "Project Role Code" = field("Project Role Code");
                }
                action("Project Staff Template Qualif")
                {
                    ApplicationArea = Basic;
                    Caption = 'Required Experience';
                    Image = QualificationOverview;
                    RunObject = Page "Project Staff Template Qualif";
                }
            }
        }
    }
}

#pragma implicitwith restore

