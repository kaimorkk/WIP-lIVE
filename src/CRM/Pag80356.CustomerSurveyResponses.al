

page 80356 "Customer Survey Responses"
{
    CardPageID = "Customer Survey Response";
    PageType = List;
    SourceTable = "Business Research Response";
    SourceTableView = where("Target Respondent Type" = const(Customers),
                            Status = const(Open));
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
                field("Business Research Category"; Rec."Business Research Category")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Business Research Category field.';
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Document Date field.';
                }
                field("Survey ID"; Rec."Survey ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Survey ID field.';
                }
                field("Survey Type"; Rec."Survey Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Survey Type field.';
                }
                field("Target Respondent Type"; Rec."Target Respondent Type")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Target Respondent Type field.';
                }
                field("Participant ID"; Rec."Participant ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Participant ID field.';
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Name field.';
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Description field.';
                }
                field("Project ID"; Rec."Project ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Project ID field.';
                }
                field("Primary Department ID"; Rec."Primary Department ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Primary Department ID field.';
                }
                field("Primary Directorate ID"; Rec."Primary Directorate ID")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Primary Directorate ID field.';
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

