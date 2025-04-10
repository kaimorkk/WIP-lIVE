page 52193612 "PR NSSF Setup"
{

    PageType = List;
    SourceTable = "PR NSSF";


    layout
    {
        area(content)
        {
            repeater(General)
            {
                field(Tier; Rec.Tier)
                {
                    ApplicationArea = All;
                }
                field(Earnings; Rec.Earnings)
                {
                    ApplicationArea = All;
                }
                field("Pensionable Earnings"; Rec."Pensionable Earnings")
                {
                    ApplicationArea = All;
                }
                field("Tier 1 earnings"; Rec."Tier 1 earnings")
                {
                    ApplicationArea = All;
                }
                field("Tier 1 Employee Deduction"; Rec."Tier 1 Employee Deduction")
                {
                    ApplicationArea = All;
                }
                field("Tier 1 Employer Contribution"; Rec."Tier 1 Employer Contribution")
                {
                    ApplicationArea = All;
                }
                field("Tier 2 earnings"; Rec."Tier 2 earnings")
                {
                    ApplicationArea = All;
                }
                field("Tier 2 Employee Deduction"; Rec."Tier 2 Employee Deduction")
                {
                    ApplicationArea = All;
                }
                field("Tier 2 Employer Contribution"; Rec."Tier 2 Employer Contribution")
                {
                    ApplicationArea = All;
                }
                field("Lower Limit"; Rec."Lower Limit")
                {
                    ApplicationArea = All;
                }
                field("Upper Limit"; Rec."Upper Limit")
                {
                    ApplicationArea = All;
                }
            }
        }
    }

}
