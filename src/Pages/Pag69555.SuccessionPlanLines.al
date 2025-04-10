

page 69555 "Succession Plan Lines"
{
    PageType = ListPart;
    SourceTable = "Succession Plan Lines";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Employee No"; Rec."Employee No")
                {
                    ApplicationArea = Basic;
                }
                field("Employee Name"; Rec."Employee Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field("Current Position ID"; Rec."Current Position ID")
                {
                    ApplicationArea = Basic;
                }
                field("Projected Position ID"; Rec."Projected Position ID")
                {
                    ApplicationArea = Basic;
                }
                field("Readyness Level"; Rec."Readyness Level")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Readyness Level field.';
                }
                field("Talent Code"; Rec."Talent 9 Box Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Talent 9 Box Code field.';
                }
                field("Planned Start Date"; Rec."Planned Start Date")
                {
                    ApplicationArea = Basic;
                }
                field("Planned End Date"; Rec."Planned End Date")
                {
                    ApplicationArea = Basic;
                }
                field(Directorate; Rec.Directorate)
                {
                    ApplicationArea = Basic;
                }
                field(Department; Rec.Department)
                {
                    ApplicationArea = Basic;
                }
                field(Mentor; Rec.Mentor)
                {
                    ApplicationArea = Basic;
                }
                field("Default Mentorship Template"; Rec."Default Mentorship Template")
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
            action(Initiatives)
            {
                ApplicationArea = Basic;
                RunObject = Page "Succession Plan Initiatives";
                RunPageLink = "Document No" = field("Document No"),
                              "Employee No" = field("Employee No");
            }
            action("Current Qualifications")
            {
                ApplicationArea = Basic;
                RunObject = Page "Position Requirements List";
                RunPageLink = "Position ID" = field("Current Position ID");
            }
            action("Required Qualifications")
            {
                ApplicationArea = Basic;
                RunObject = Page "Position Requirements List";
                RunPageLink = "Position ID" = field("Projected Position ID");
            }
        }
    }
}

#pragma implicitwith restore

