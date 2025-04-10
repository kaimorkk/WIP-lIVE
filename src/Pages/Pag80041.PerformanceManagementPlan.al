

page 80041 "Performance Management Plan"
{
    PageType = Card;
    SourceTable = "Performance Management Plan";

    layout
    {
        area(content)
        {
            group(General)
            {
                field(No; Rec.No)
                {
                    ApplicationArea = Basic;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = Basic;
                }
                field("Strategy Plan ID"; Rec."Strategy Plan ID")
                {
                    ApplicationArea = Basic;
                }
                field("Annual Reporting Code"; Rec."Annual Reporting Code")
                {
                    ApplicationArea = Basic;
                }
                field("Start Date"; Rec."Start Date")
                {
                    ApplicationArea = Basic;
                }
                field("End Date"; Rec."End Date")
                {
                    ApplicationArea = Basic;
                }
                field("Evaluation Type"; Rec."Evaluation Type")
                {
                    ApplicationArea = Basic;
                }
                field("HR Performance Template"; Rec."HR Performance Template")
                {
                    ApplicationArea = Basic;
                }
                field("Performance Contract  Template"; Rec."Performance Contract  Template")
                {
                    ApplicationArea = Basic;
                }
                field("Executive Summary"; Rec."Executive Summary")
                {
                    ApplicationArea = Basic;
                }
                field(Blocked; Rec.Blocked)
                {
                    ApplicationArea = Basic;
                }
            }
            part(Control13; "Performance Plan Tasks")
            {
                SubPageLink = "Performance Mgt Plan ID" = field(No);
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
        area(creation)
        {
            action("Performance Appraisals")
            {
                ApplicationArea = Basic;
                Image = "Action";
                RunObject = Page "Standard Perfomance Appraisal";
                RunPageLink = "Performance Mgt Plan ID" = field(No),
                              "Document Type" = const("Performance Appraisal");
            }
            action("Performance Appeals")
            {
                ApplicationArea = Basic;
                Image = AddContacts;
                RunObject = Page "Standard Perfomance Appraisal";
                RunPageLink = "Performance Mgt Plan ID" = field(No),
                              "Document Type" = const("Performance Appeal");
            }
            action(PIPs)
            {
                ApplicationArea = Basic;
                Image = Addresses;
                RunObject = Page "Performance Improvement Plans";
            }
            action("Performance Mgmt Policies")
            {
                ApplicationArea = Basic;
                Image = AddAction;
                RunObject = Page "Performance Plan Guidelines";
                RunPageLink = "Performance Mgt Plan ID" = field(No);
            }
            action("Review Periods")
            {
                ApplicationArea = Basic;
                Image = Replan;
                RunObject = Page "Review Periods";
            }
        }
        area(Promoted)
        {
            group(Category_Process)
            {
                actionref("Performance Appraisals_Promoted"; "Performance Appraisals")
                {
                }
                actionref("Performance Appeals_Promoted"; "Performance Appeals")
                {
                }
            }
            group(Category_Category4)
            {
                actionref(PIPs_Promoted; PIPs)
                {
                }
                actionref("Performance Mgmt Policies_Promoted"; "Performance Mgmt Policies")
                {
                }
                actionref("Review Periods_Promoted"; "Review Periods")
                {
                }
            }
        }
    }
}

#pragma implicitwith restore

