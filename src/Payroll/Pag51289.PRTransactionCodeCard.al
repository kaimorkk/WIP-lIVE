
page 52193675 "PR Transaction Code Card"
{
    PageType = Card;
    SourceTable = "PR Transaction Codes";
    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field(TransactionType; Rec."Transaction Type")
                {
                    ApplicationArea = All;
                }
                field(TransactionCode; Rec."Transaction Code")
                {
                    ApplicationArea = All;
                    Editable = true;
                }

                field(TransactionName; Rec."Transaction Name")
                {
                    ApplicationArea = All;
                }

                field(TransactonCat; Rec."Transaction Category")
                {
                    ApplicationArea = All;
                }
                // field("Non Assignable"; "Non Assignable")
                // {
                //     ApplicationArea = All;
                // }
                field(Frequency; Rec."Frequency")
                {
                    ApplicationArea = All;
                }

                field(BalanceType; Rec."Balance Type")
                {
                    ApplicationArea = All;
                    ValuesAllowed = None, Increasing, Reducing;
                }
                field("Calculation Method"; Rec."Calculation Method")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Calculation Method field.';
                }
                field("Formula %"; Rec."Formula %")
                {
                    Caption = 'Rate';
                    ApplicationArea = All;
                }
                field("Recalculate if Basic Changes"; Rec."Recalculate Basic Changes")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Recalculate Basic Changes field.';
                }
                field("Applies to All"; Rec."Applies to All")
                {
                    ApplicationArea = All;
                    Caption = 'Default Allowance';
                    ToolTip = 'Specifies the value of the Applies to All field.';
                }
                field("Employer Deduction"; Rec."Employer Deduction")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Employer Deduction field.';
                }
                field("Employer Rate"; Rec."Employer Rate")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Employer Rate field.';
                }
                field("Employer Limit"; Rec."Employer Limit")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Employer Limit field.', Comment = '%';
                }
                field(Taxable; Rec.Taxable)
                {
                    ApplicationArea = All;
                }
                field("Tax Exempt Amount"; Rec."Tax Exempt Amount")
                {
                    ApplicationArea = All;
                    ToolTip = 'The amount that is not taxable if the benefit is tax exempt and the exemption has a limit.';
                }
                field("Exempt Housing Levy"; Rec."Exempt Housing Levy")
                {
                    ApplicationArea = All;
                }
                field("Basic Salary Arrears"; Rec."Basic Salary Arrears")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Basic Salary Arrears field.';
                }
                field("Not Included Third"; Rec."Not Included Third")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Not included in a Third Rule field.';
                }

                field(DisableProration; Rec."Disable Proration")
                {
                    ApplicationArea = All;
                    Caption = 'Prorated';
                }
                field("Non Assignable"; Rec."Non Assignable")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Non Assignable field.', Comment = '%';
                }

                field("Skip Transfer in Next Period"; Rec."Skip Transfer in Next Period")
                {
                    ApplicationArea = all;
                }
                field("Transaction Charge Code"; Rec."Transaction Charge Code")
                {
                    ApplicationArea = all;
                }
                field(IsFormula; Rec."Is Formula")
                {
                    ApplicationArea = All;
                }
                field(Formula; Rec.Formula)
                {
                    ApplicationArea = All;
                }


                field("Is Formula for employer"; Rec."Is Formula for employer")
                {
                    ApplicationArea = all;
                }

                field(GLAccount; Rec."GL Account")
                {
                    ApplicationArea = All;
                }
                field(GLAccountName; Rec."G/L Account Name")
                {
                    ApplicationArea = All;
                    Enabled = false;
                }
                field(Subledger; Rec.Subledger)
                {
                    ApplicationArea = All;
                }
                field(CustomerPostingGroup; Rec.CustomerPostingGroup)
                {
                    ApplicationArea = All;
                }
                field("Imprest Surrender"; Rec."Imprest Surrender")
                {
                    ApplicationArea = All;
                }
                // field("Arrears Code"; Rec."Arrears Code")
                // {
                //     ApplicationArea = All;
                //     ToolTip = 'Specifies the value of the Arrears Code field.';
                // }

                field("Is Leave Allowance"; Rec."Is Leave Allowance")
                {
                    ApplicationArea = All;
                }
                field(isHouseAllowance; Rec.isHouseAllowance)
                {
                    caption = 'Is House Allowance';
                    ApplicationArea = All;
                }
                field("Is Acting Allowance"; Rec."Is Acting Allowance")
                {
                    ApplicationArea = Basic;
                }
                field("Acting Transaction Code"; Rec."Acting Transaction Code")
                {
                    ApplicationArea = Basic;
                }
                field(Status; Rec.Status)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Status field.';
                }
                field("Commission Type"; Rec."Commission Type")
                {
                    ApplicationArea = All;
                }
                field(Commission; Rec.Commission)
                {
                    ApplicationArea = All;
                }
                field("Pay Code"; Rec."Pay Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Pay Code field.';
                }
                field(Vendor; Rec.Vendor)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Vendor field.';
                }
                field("Vendor Name"; Rec."Vendor Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Vendor Name field.';
                }


            }
            group(OtherSetUps)
            {
                Caption = 'Other Set-Ups';
                field(SpecialTransDeductions; Rec."Special Trans Deductions")
                {
                    ApplicationArea = All;
                }
                field(SpecialTransIncomes; Rec."Special Trans Incomes")
                {
                    ApplicationArea = All;
                }
                field(RepaymentMethod; Rec."Repayment Method")
                {
                    ApplicationArea = All;
                }
                field(coopparameters; Rec."coop parameters")
                {
                    ApplicationArea = All;
                }

                field("Deduct Premium"; Rec."Deduct Premium")
                {
                    ApplicationArea = All;

                }

                field("Intrest Transaction Code"; Rec."Intrest Transaction Code")
                {
                    ApplicationArea = All;

                }

                field("Interest Rate"; Rec."Interest Rate")
                {
                    ApplicationArea = All;

                }
                field("Arrears Code"; Rec."Arrears Code")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Arrears Code field.';
                }
                field("Deduct From Taxable Pay"; Rec."Deduct From Taxable Pay")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Deduct From Taxable Pay field.', Comment = '%';
                }
                field("Deduction Limit"; Rec."Deduction Limit")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Deduction Limit field.', Comment = '%';
                }
            }
            group(Grouping)
            {
                Caption = 'Grouping';
                field(GroupCode; Rec."Group Code")
                {
                    ApplicationArea = All;
                    TableRelation = "PR Transaction Codes";
                }
                field(GroupDescription; Rec."Group Description")
                {
                    ApplicationArea = All;
                }

            }
        }
    }

    actions
    {
        area(processing)
        {
            // action("Assign Formulae Per Directorate")
            // {
            //     ApplicationArea = All;
            //     Image = Calculate;
            //     Promoted = true;
            //     PromotedCategory = Process;
            //     RunObject = Page "PR Transaction Formula List";
            //     RunPageLink = "Transaction Code" = field("Transaction Code");
            // }
            action(SendApprovalRequest)
            {
                ApplicationArea = Basic;
                Caption = 'Send A&pproval Request';
                //Enabled = not OpenApprovalEntriesExist;
                Image = SendApprovalRequest;
                ToolTip = 'Executes the Send A&pproval Request action.';
                trigger OnAction()
                begin
                    Rec.TestField(Status, Rec.Status::Open);
                    VarVariant := Rec;
                    if ApprovalsMgmt.CheckApprovalsWorkflowEnabled(VarVariant) then
                        ApprovalsMgmt.OnSendDocForApproval(VarVariant);

                end;
            }
            action(CancelApprovalRequest)
            {
                ApplicationArea = Basic;
                Caption = 'Cancel Approval Re&quest';
                Image = Cancel;
                ToolTip = 'Executes the Cancel Approval Re&quest action.';
                trigger OnAction()
                begin
                    Rec.TestField(Status, Rec.Status::"Pending Approval");
                    VarVariant := Rec;
                    if ApprovalsMgmt.CheckApprovalsWorkflowEnabled(VarVariant) then
                        ApprovalsMgmt.OnCancelDocApprovalRequest(VarVariant);
                end;
            }

        }
        area(Promoted)
        {
            group(Category_New)
            {
                Caption = 'New', Comment = 'Generated from the PromotedActionCategories property index 0.';

                actionref(SendApprovalRequest_Promoted; SendApprovalRequest)
                {
                }
                actionref(CancelApprovalRequest_Promoted; CancelApprovalRequest)
                {
                }
            }
            group(Category_Report)
            {
                Caption = 'Report', Comment = 'Generated from the PromotedActionCategories property index 2.';
            }
            group(Category_Category4)
            {
                Caption = 'Approvals', Comment = 'Generated from the PromotedActionCategories property index 3.';
            }
        }
    }

    trigger OnOpenPage()
    begin
        UpdateControl_SpecialTrans
    end;

    var
        Text19025872: label 'E.g ([005]+[020]*[24])/2268';
        Text19080001: label 'E.g ([005]+[020]*[24])/2268';
        IsFormulaPerDirecEDITABLE: Boolean;
        ApprovalsMgmt: Codeunit "Custom Approvals Codeunit";
        VarVariant: Variant;

    local procedure UpdateControl_SpecialTrans()
    begin
        if Rec."Is Formula Per Directorate" then begin
            IsFormulaPerDirecEDITABLE := false;

            Rec."Is Formula" := false;
            Rec."Employer Deduction" := false;
            Rec."Include Employer Deduction" := false;
            Rec."Is Formula for employer" := '';
            Rec.Formula := '';
        end else begin
            IsFormulaPerDirecEDITABLE := true;
        end;
    end;
}

#pragma implicitwith restore

