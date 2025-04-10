

page 75240 "PRN Personnel Specification"
{
    PageType = List;
    SourceTable = "PRN Personnel Specification";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Staff Role Code"; Rec."Staff Role Code")
                {
                    ApplicationArea = Basic;
                }
                field("Title/Designation Description"; Rec."Title/Designation Description")
                {
                    ApplicationArea = Basic;
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
        area(navigation)
        {
            group(Line)
            {
                Caption = 'Line';
                action("PRN Personnel Qualification")
                {
                    ApplicationArea = Basic;
                    Caption = 'Qualification Requirements';
                    Image = PlanningWorksheet;
                    RunObject = Page "PRN Personnel Qualification";
                    RunPageLink = "Document Type" = field("Document Type"),
                                  "Document No." = field("Document No."),
                                  "Staff Role Code" = field("Staff Role Code");
                }
                action("PRN Personnel Experience")
                {
                    ApplicationArea = Basic;
                    Caption = 'Experience Requirements';
                    Image = QualificationOverview;
                    RunObject = Page "PRN Personnel Experience";
                    RunPageLink = "Document Type" = field("Document Type"),
                                  "Document No." = field("Document No."),
                                  "Staff Role Code" = field("Staff Role Code");
                }
            }
        }
        area(Promoted)
        {
            group(Category_New)
            {
                actionref("PRN Personnel Qualification_Promoted"; "PRN Personnel Qualification")
                {
                }
                actionref("PRN Personnel Experience_Promoted"; "PRN Personnel Experience")
                {
                }
            }
        }
    }
}

#pragma implicitwith restore

