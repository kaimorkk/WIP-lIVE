

page 95007 "Communication Plan Lines"
{
    PageType = ListPart;
    SourceTable = "Communication Plan Line";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Document Type"; Rec."Document Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document Type field.';
                }
                field("Document No"; Rec."Document No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document No field.';
                }
                field(Category; Rec.Category)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Category field.';
                }
                field("Line No"; Rec."Line No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Line No field.';
                }
                field("Communication Type"; Rec."Communication Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Communication Type field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field(Frequency; Rec.Frequency)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Frequency field.';
                }
                field("Default Meeting Medium"; Rec."Default Meeting Medium")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Default Meeting Medium field.';
                }
                field("Primary Owner"; Rec."Primary Owner")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Primary Owner field.';
                }
                field("First Meeting Date"; Rec."First Meeting Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the First Meeting Date field.';
                }
                field("No. of Target Stakeholders"; Rec."No. of Target Stakeholders")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. of Target Stakeholders field.';
                }
                field("No. of Planned Meetings"; Rec."No. of Planned Meetings")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. of Planned Meetings field.';
                }
                field("No. of Meetings Held"; Rec."No. of Meetings Held")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. of Meetings Held field.';
                }
                field("Default Report Medium"; Rec."Default Report Medium")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Default Report Medium field.';
                }
                field("No. of Project Reports"; Rec."No. of Project Reports")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the No. of Project Reports field.';
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            group("Line Function")
            {
                Image = RollUpCosts;
                action("Comm Plan Meeting Schedules")
                {
                    ApplicationArea = Basic;
                    Image = RollUpCosts;
                    RunObject = Page "Comm Plan Meeting Schedules";
                    RunPageLink = "Document Type" = field("Document Type"),
                                  "Document No" = field("Document No"),
                                  Category = field(Category);
                    ToolTip = 'Executes the Comm Plan Meeting Schedules action.';
                }
                action("Comm Plan Line Stakeholders")
                {
                    ApplicationArea = Basic;
                    Image = SpecialOrder;
                    RunObject = Page "Comm Plan Line Stakeholders";
                    RunPageLink = "Document Type" = field("Document Type"),
                                  "Document No" = field("Document No"),
                                  Category = field(Category);
                    ToolTip = 'Executes the Comm Plan Line Stakeholders action.';
                }
            }
        }
    }
}

#pragma implicitwith restore

