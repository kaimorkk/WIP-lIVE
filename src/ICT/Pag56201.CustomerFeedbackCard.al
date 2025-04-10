

page 56201 "Customer Feedback Card"
{
    Caption = 'Customer Feedback';
    PageType = Card;
    SourceTable = "Customer FeedbackS";

    layout
    {
        area(content)
        {
            group(General)
            {
                field(No; Rec.No)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the No field.';
                }
                field("Feedback Date"; Rec."Feedback Date")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Feedback Date field.';
                }
                field("Created By"; Rec."Created By")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Created By field.';
                }
                field("Date created"; Rec."Date created")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Date created field.';
                }
                field("Time created"; Rec."Time created")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Time created field.';
                }
                field(Gender; Rec.Gender)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Gender field.';
                }
                field(Age; Rec.Age)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Age field.';
                }
                field(Organization; Rec.Organization)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Organization field.';
                }
                field(Email; Rec.Email)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Email field.';
                }
                field("Phone No"; Rec."Phone No")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Phone No field.';
                }
                field(Reception; Rec.Reception)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Reception at the Gate field.';
                }
                field("Prompt Services"; Rec."Prompt Services")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Prompt Services to Customers at the reception area field.';
                }
                field("Reception Facilities"; Rec."Reception Facilities")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Reception Area Facilities(Comfort) field.';
                }
                field(Professionalism; Rec.Professionalism)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Professionalism & Courtesy of Staff field.';
                }
                field("General Presentation"; Rec."General Presentation")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the General Presentation & Honesty of staff field.';
                }
                field(Efficiency; Rec.Efficiency)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Efficiency with the service provided field.';
                }
                field(Quality; Rec.Quality)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Quality of Advice/Information Provided field.';
                }
                field(Knowledge; Rec.Knowledge)
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Knowledge of Staff on KEMRI products and services field.';
                }
                field("Recommendation Likelihood"; Rec."Recommendation Likelihood")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the How Likely are you to recommend KEMRI products/services to another person? field.';
                }
                field("Services Sought"; Rec."Services Sought")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Which Kind of Service/Product were you seeking/accessing at KEMRI? field.';
                }
                field("Any Problems"; Rec."Any Problems")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Did you experience any problems with our products or Services field.';
                }
                field("Overall satisfaction"; Rec."Overall satisfaction")
                {
                    ApplicationArea = Basic;
                    ToolTip = 'Specifies the value of the Overall, how satisfied areyou with the service/products provided? field.';
                }
                field(Comments; Rec.Comments)
                {
                    ApplicationArea = Basic;
                    MultiLine = true;
                    ToolTip = 'Specifies the value of the Comments field.';
                }
                field(Improvement; Rec.Improvement)
                {
                    ApplicationArea = Basic;
                    MultiLine = true;
                    ToolTip = 'Specifies the value of the How can we improve on our services? field.';
                }
            }
        }
        area(factboxes)
        {
            systempart(Control12; Notes)
            {
                ApplicationArea = Basic;
            }
        }
    }

    actions
    {
        area(creation)
        {
            action("&Print")
            {
                ApplicationArea = Basic;
                Caption = '&Print';
                Ellipsis = true;
                Image = Print;
                ToolTip = 'Executes the &Print action.';
                trigger OnAction()
                begin
                    //DocPrint.PrintPurchHeader(Rec);


                    Rec.SetRange(No, Rec.No);
                    Report.Run(56200, true, true, Rec)
                end;
            }
        }
        area(Promoted)
        {
            group(Category_Process)
            {
                actionref("&Print_Promoted"; "&Print")
                {
                }
            }
        }
    }
}

#pragma implicitwith restore

