

page 80358 "Post Project Survey Responses"
{
    CardPageID = "Post Project Survey Response";
    PageType = List;
    SourceTable = "Business Research Response";
    SourceTableView = where("Target Respondent Type" = const(Contacts),
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
                }
                field("Business Research Category"; Rec."Business Research Category")
                {
                    ApplicationArea = Basic;
                }
                field("Document Date"; Rec."Document Date")
                {
                    ApplicationArea = Basic;
                }
                field("Survey ID"; Rec."Survey ID")
                {
                    ApplicationArea = Basic;
                }
                field("Survey Type"; Rec."Survey Type")
                {
                    ApplicationArea = Basic;
                }
                field("Target Respondent Type"; Rec."Target Respondent Type")
                {
                    ApplicationArea = Basic;
                }
                field("Participant ID"; Rec."Participant ID")
                {
                    ApplicationArea = Basic;
                }
                field(Name; Rec.Name)
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("Project ID"; Rec."Project ID")
                {
                    ApplicationArea = Basic;
                }
                field("Primary Department ID"; Rec."Primary Department ID")
                {
                    ApplicationArea = Basic;
                }
                field("Primary Directorate ID"; Rec."Primary Directorate ID")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
    }
}

#pragma implicitwith restore

