 
//    table 56007 "Receipts Header1"
// {
//     // DrillDownPageID = "Receipts List";
//     // LookupPageID = "Receipts List";
//     DrillDownPageID = "Receipt Lookup List";
//     LookupPageID = "Receipt Lookup List";
//     DataClassification = CustomerContent;

//     fields
//     {
//         field(1; "No."; Code[20])
//         {
//             Editable = false;
//         }
//         field(2; Date; Date)
//         {
//             Caption = 'Document Date';
//         }
//         field(3; "Pay Mode"; Code[20])
//         {
//             TableRelation = "Pay Mode";
//             ValidateTableRelation = false;
//         }
//         field(4; "Cheque No"; Code[20])
//         {
//         }
//         field(5; "Cheque Date"; Date)
//         {
//         }
//         field(6; Amount; Decimal)
//         {
//             CalcFormula = sum("Receipt Lines1".Amount where("Receipt No." = field("No.")));
//             FieldClass = FlowField;
//         }
//         field(7; "Amount(LCY)"; Decimal)
//         {
//             CalcFormula = sum("Receipt Lines1"."Amount (LCY)" where("Receipt No." = field("No.")));
//             Editable = false;
//             FieldClass = FlowField;
//         }
//         field(8; "Bank Code"; Code[20])
//         {
//             //TableRelation =  Rec.Receip "Bank Account";
//             TableRelation = if ("Receipt Type" = const(Deposit)) "Bank Account" where(Type = filter(Revenue | Deposit)
//             ) else
//             "Bank Account";

//             trigger OnValidate()
//             var
//                 BankAccount: Record "Bank Account";
//             begin
//                 BankAccount.Reset;
//                 BankAccount.SetRange("No.", "Bank Code");
//                 if BankAccount.FindFirst then begin
//                     "Bank Name" := BankAccount.Name;
//                 end
//             end;
//         }
//         field(9; "Received From"; Text[250])
//         {
//         }
//         field(10; "On Behalf Of"; Text[100])
//         {
//         }
//         field(11; Cashier; Code[50])
//         {
//         }
//         field(12; Posted; Boolean)
//         {
//             trigger OnValidate()
//             var
//                 Receip: Record "Receipts Header1";
//             begin
//                 if "Receipt Type" = "Receipt Type"::AIE then begin
//                     Receip.Reset;
//                     Receip.SetRange("Receipt Type", "Receipt Type"::AIE);
//                     Receip.SetRange(Closed, false);
//                     Receip.SetRange(Posted, true);
//                     Receip.SetRange("Global Dimension 2 Code", "Global Dimension 2 Code");
//                     Receip.SetFilter("No.", '<>%1', "No.");
//                     if Receip.FindSet() then
//                         Receip.ModifyAll(Closed, true);

//                 end;
//             end;
//         }
//         field(13; "Posted Date"; Date)
//         {
//         }
//         field(14; "Posted Time"; Time)
//         {
//         }
//         field(15; "Posted By"; Code[30])
//         {
//         }
//         field(16; "No. Series"; Code[20])
//         {
//             TableRelation = "No. Series";
//         }
//         field(17; "Currency Code"; Code[20])
//         {
//             TableRelation = Currency;

//             trigger OnValidate()
//             begin
//                 if not (CurrFieldNo in [0, FieldNo(Date)]) or ("Currency Code" <> xRec."Currency Code") then
//                     TestField(Status, Status::Open);
//                 if (CurrFieldNo <> FieldNo("Currency Code")) and ("Currency Code" = xRec."Currency Code") then
//                     UpdateCurrencyFactor
//                 else
//                     if "Currency Code" <> xRec."Currency Code" then
//                         UpdateCurrencyFactor
//                     else
//                         if "Currency Code" <> '' then begin
//                             UpdateCurrencyFactor;
//                             if "Currency Factor" <> xRec."Currency Factor" then
//                                 ConfirmUpdateCurrencyFactor;
//                         end;
//             end;
//         }
//         field(18; "Global Dimension 1 Code"; Code[20])
//         {
//             CaptionClass = '1,2,1';
//             TableRelation = "Dimension Value".Code where("Global Dimension No." = const(1));
//             trigger OnValidate()
//             begin
//                 ValidateShortcutDimCode(1, "Global Dimension 1 Code");

//                 Validate("Shortcut Dimension 1 Code", "Global Dimension 1 Code");
//             end;
//         }
//         field(19; "Global Dimension 2 Code"; Code[20])
//         {
//             CaptionClass = '1,2,2';
//             TableRelation = "Dimension Value".Code where("Global Dimension No." = const(2));
//             trigger OnValidate()
//             begin
//                 ValidateShortcutDimCode(2, "Global Dimension 2 Code");
//                 Validate("Shortcut Dimension 2 Code", "Global Dimension 2 Code");
//             end;
//         }
//         field(20; Status; Enum ReceiptStatus)
//         {
//             trigger OnValidate()
//             var
//                 paymentPost: Codeunit "Payments-Post";
//             begin
//                 paymentPost.checkIFAttachmentExists(Rec."No.");
//             end;
//         }
//         field(21; "Fully Allocated"; Boolean)
//         {
//             CalcFormula = lookup("Petty Cash Lines"."Fully Allocated" where("Receipt No." = field("No.")));
//             FieldClass = FlowField;
//         }
//         field(22; "Allocated Amount"; Decimal)
//         {
//             CalcFormula = sum("Petty Cash Lines"."Cash Receipt Amount" where("Receipt No." = field("No.")));
//             FieldClass = FlowField;
//         }
//         field(23; "Fully Allocated Imprest"; Boolean)
//         {
//             CalcFormula = lookup("Imprest Lines"."Fully Allocated" where("Receipt No." = field("No.")));
//             FieldClass = FlowField;
//         }
//         field(24; "Depot Name"; Text[150])
//         {
//             Editable = false;
//         }
//         field(25; "Department Name"; Text[250])
//         {
//             Editable = false;
//             FieldClass = FlowField;
//             CalcFormula = lookup("Dimension Value".Name where("Global Dimension No." = const(1), Code = field("Shortcut Dimension 1 Code")));
//             CaptionClass = '1,5,,' + DimensionValue.GetDimensionCaption(1);
//         }
//         field(26; "Being Payment of"; Text[250])
//         {
//         }
//         field(27; "Payment Reference"; Code[100])
//         {
//         }
//         field(28; ID; Code[15])
//         {
//         }
//         field(29; "Tel No"; Code[20])
//         {
//         }
//         field(33; "Currency Factor"; Decimal)
//         {
//             Caption = 'Currency Factor';
//             DecimalPlaces = 0 : 15;
//             Editable = false;
//             MinValue = 0;
//         }
//         field(80; "Document Type"; Option)
//         {
//             OptionCaption = 'Normal Receipt,Petty Cash,Imprest,Imprest Surrender,Bank Transfer,Surrender,Staff Claims,Miscellaneous Receipt';
//             OptionMembers = "Payment Voucher","Petty Cash",Imprest,"Imprest Surrender","Bank Transfer",Surrender,"Staff Claims","Student Receipt";
//         }
//         field(480; "Dimension Set ID"; Integer)
//         {
//             Caption = 'Dimension Set ID';
//             Editable = false;
//             // TableRelation = "Dimension Set Entry";
//         }
//         field(481; "Posting Date"; Date)
//         {
//         }
//         field(482; "Reason for Reversing"; Text[250])
//         {
//         }
//         field(483; Reversed; Boolean)
//         {
//             Editable = false;
//             // CalcFormula = lookup("G/L Entry".Reversed where("Document No." = field("No.")));
//             // FieldClass = FlowField;
//         }
//         field(484; "Reversed By"; Code[50])
//         {
//             Editable = false;
//         }
//         field(485; "Date Reversed"; Date)
//         {
//             Editable = false;
//         }
//         field(486; "Time Reversed"; Time)
//         {
//             Editable = false;
//         }
//         field(487; "Shortcut Dimension 1 Code"; Code[20])
//         {
//             CaptionClass = '1,2,1';
//             Caption = 'Shortcut Dimension 1 Code';
//             TableRelation = "Dimension Value".Code where("Global Dimension No." = const(1),
//                                                           Blocked = const(false));

//             trigger OnValidate()
//             begin
//                 ValidateShortcutDimCode(1, "Shortcut Dimension 1 Code");
//             end;
//         }
//         field(488; "Shortcut Dimension 2 Code"; Code[20])
//         {
//             CaptionClass = '1,2,2';
//             Caption = 'Shortcut Dimension 2 Code';
//             TableRelation = "Dimension Value".Code where("Global Dimension No." = const(2),
//                                                           Blocked = const(false));
//             trigger OnValidate()
//             begin
//                 ValidateShortcutDimCode(2, "Shortcut Dimension 2 Code");
//             end;
//         }
//         field(489; "Direct Income Voucher"; Boolean)
//         {
//         }
//         field(490; "Expense Account"; Code[20])
//         {
//             TableRelation = "G/L Account"."No.";
//         }
//         field(51200; "Application No."; Code[30])
//         {
//         }
//         field(85000; "Payment Reference No."; Code[50])
//         {
//         }
//         field(85001; "Remaining Amount"; Decimal)
//         {
//         }
//         field(85002; "Bank Name"; Text[100])
//         {
//         }
//         field(85003; "Case No."; Code[50])
//         {
//             DataClassification = CustomerContent;
//         }
//         field(85004; "Case Type"; Code[50])
//         {
//             Caption = 'Case Type';
//             DataClassification = CustomerContent;
//         }
//         field(85005; "Case Title"; Text[2048])
//         {
//             DataClassification = CustomerContent;
//         }
//         field(85006; "PRN No."; Code[50])
//         {
//             DataClassification = CustomerContent;
//         }

//         field(85007; "Invoice No."; Code[50])
//         {
//             Caption = 'Invoice No.';
//             DataClassification = CustomerContent;
//         }
//         field(85008; "Bank Reference No."; Code[50])
//         {
//             Caption = 'Invoice No.';
//             DataClassification = CustomerContent;
//         }
//         field(85009; "Receipt Type"; Enum "Receipt Type")
//         {
//             Caption = 'Receipt Type';
//             DataClassification = CustomerContent;
//         }
//         field(85010; Notified; Boolean)
//         {
//             DataClassification = ToBeClassified;
//         }
//         field(85011; "Mobile No"; Code[15])
//         {
//             DataClassification = ToBeClassified;
//         }
//         field(85012; "Transaction DateTime"; DateTime)
//         {
//             DataClassification = SystemMetadata;
//         }
//         field(85013; "QR Code"; Blob)
//         {
//             DataClassification = ToBeClassified;
//         }
//         field(85014; Refunded; Boolean)
//         {
//             DataClassification = ToBeClassified;
//         }
//         field(85015; "Utilized Amount"; Decimal)
//         {
//             DataClassification = ToBeClassified;
//         }
//         field(85016; "Case ID"; Integer)
//         {
//             DataClassification = ToBeClassified;
//         }
//         field(85017; "Receipt Generation"; Option)
//         {
//             DataClassification = ToBeClassified;
//             OptionMembers = ERP,CTS;
//         }
//         field(85018; "Project Name"; Code[100])
//         {
//             CalcFormula = lookup("Dimension Value".Name where(Code = field("Shortcut Dimension 2 Code"), "Global Dimension No." = const(2)));
//             Editable = false;
//             FieldClass = FlowField;
//             CaptionClass = '1,5,,' + DimensionValue.GetDimensionCaption(2);
//         }
//         field(85019; "Source RecordID"; RecordId)
//         {
//             DataClassification = ToBeClassified;
//             Editable = false;
//         }
//         field(85020; "Select"; Boolean)
//         {
//             DataClassification = ToBeClassified;
//         }
//         field(85021; Retries; Integer)
//         {
//             DataClassification = SystemMetadata;
//         }
//         field(85022; Failed; Boolean)
//         {
//             DataClassification = ToBeClassified;
//         }
//         field(85023; ErrorMessage; Text[2048])
//         {
//             DataClassification = ToBeClassified;
//         }
//         field(85024; "Previous Receipt"; Code[20])
//         {
//             DataClassification = ToBeClassified;
//             TableRelation = "Receipts Header1"."No." where("Receipt Type" = filter(AIE), "Global Dimension 2 Code" = field("Global Dimension 2 Code"));
//         }
//         field(85025; Closed; Boolean)
//         {
//             DataClassification = ToBeClassified;
//         }
//         field(85026; "Total Committed Amount"; Decimal)
//         {
//             Editable = false;
//             FieldClass = FlowField;
//             CalcFormula = sum(Payments."Committed Amount" where("AIE Receipt" = field("No."), "Shortcut Dimension 2 Code" = field("Shortcut Dimension 2 Code"), Reversed = const(false)));
//         }
//         field(85027; "Balance BF"; Decimal)
//         {
//             DataClassification = CustomerContent;
//         }
//         field(34; transfered; Boolean)
//         {
//             DataClassification = ToBeClassified;
//         }
//         field(35; "Transfered Date"; DateTime)
//         {
//             DataClassification = ToBeClassified;
//         }
//         field(36; "Transfered By"; Code[20])
//         {
//             DataClassification = ToBeClassified;
//         }
//         field(37; "Transfered From"; Code[20])
//         {
//             DataClassification = ToBeClassified;
//         }

//         field(38; "applies to doc no"; Code[20])
//         {
//             DataClassification = ToBeClassified;

//             // FieldClass = FlowField;
//             // CalcFormula = Lookup("Receipt Lines1"."Applies to Doc. No" where("Receipt No." = field("No.")));

//         }
//         field(39; "Bounced Payment Doc"; Code[20])
//         {
//             DataClassification = ToBeClassified;
//             Caption = 'Bounced Payment Doc';
//             trigger OnLookup()
//             var
//                 OutwardPaymentBuffer: Record "Outward Payment Buffer";
//                 Payment: Record Payments;
//             begin

//                 "Bounced Payment Doc" := '';
//                 Rec.TestField("Bank Code");
//                 OutwardPaymentBuffer.Reset();
//                 OutwardPaymentBuffer.SetRange(markPayment, true);
//                 OutwardPaymentBuffer.setRange(receiptProcessed, false);
//                 OutwardPaymentBuffer.SetRange(PayingAccountNo, getBankAccountNumber(Rec."Bank Code"));
//                 if Page.RunModal(50463, OutwardPaymentBuffer) = Action::LookupOK then begin
//                     "Bounced Payment Doc" := OutwardPaymentBuffer."Source Document No.";
//                     validate("Bounced Payment Doc");
//                 end;
//             end;

//             trigger OnValidate()
//             var
//                 OutwardPaymentBuffer: Record "Outward Payment Buffer";
//                 Payment: Record Payments;
//             begin

//                 clearReceiptLines();

//                 OutwardPaymentBuffer.Reset();
//                 OutwardPaymentBuffer.SetRange("Source Document No.", "Bounced Payment Doc");
//                 OutwardPaymentBuffer.SetRange(markPayment, true);
//                 if Not OutwardPaymentBuffer.FindFirst() then
//                     Error('Payment not marked as Bounced/Failed');
//                 isPaymentReceipted("Bounced Payment Doc");
//                 payment.reset();
//                 payment.setRange("No.", "Bounced Payment Doc");
//                 Payment.SetRange(Retried, false);
//                 if (Payment.FindFirst()) then begin
//                     populateReceiptDetails(Payment);

//                 end



//             end;






//         }

//         field(40; ReceiptProcessed; Boolean)
//         {
//             DataClassification = ToBeClassified;
//             Caption = 'Receipt Processed';

//         }



//     }

//     keys
//     {
//         key(Key1; "No.")
//         {
//             Clustered = true;
//         }
//     }

//     fieldgroups
//     {
//         fieldgroup(DropDown; "No.", Date, "Posted Date", "Received From", "Being Payment of")
//         {
//         }
//     }

//     trigger OnInsert()
//     var
//         CurrDimensions, DefaultDimensions : array[8] of Code[20];
//         DefaultDimensionsRec: Record "Default Dimension Custom";
//     begin
//         if rec."No." = '' then begin
//             if "Document Type" = "document type"::"Student Receipt" then begin
//                 ExaminationSetup.Get;
//                 ExaminationSetup.TestField("Student Receipt Nos");
//                 "No." := NoSeriesMgt.GetNextNo(ExaminationSetup."Student Receipt Nos", Today, true);
//             end
//             else begin
//                 case
//                     "Receipt Type" of
//                     "Receipt Type"::" ", "Receipt Type"::Normal:
//                         begin
//                             CashMgt.Get;
//                             CashMgt.TestField("Receipt Nos");
//                             "No." := NoSeriesMgt.GetNextNo(CashMgt."Receipt Nos", Today, true);
//                             DefaultDimensionsRec.GetDimensionCodes(DefaultDimensionsRec."Document Type"::Receipt, DefaultDimensions);
//                         end;
//                     "Receipt Type"::Deposit:
//                         begin
//                             CashMgt.Get;
//                             CashMgt.TestField("Deposit Receipt Nos");
//                             "No." := NoSeriesMgt.GetNextNo(CashMgt."Deposit Receipt Nos", Today, true);
//                             DefaultDimensionsRec.GetDimensionCodes(DefaultDimensionsRec."Document Type"::"Deposit Receipt", DefaultDimensions);
//                         end;
//                     "Receipt Type"::Fee:
//                         begin
//                             CashMgt.Get;
//                             CashMgt.TestField("Revenue Receipt Nos");
//                             "No." := NoSeriesMgt.GetNextNo(CashMgt."Revenue Receipt Nos", Today, true);
//                             DefaultDimensionsRec.GetDimensionCodes(DefaultDimensionsRec."Document Type"::"Revenue Receipt", DefaultDimensions);
//                         end;
//                     "Receipt Type"::Utilization:
//                         begin
//                             CashMgt.Get;
//                             CashMgt.TestField("Utilization Receipt Nos");
//                             "No." := NoSeriesMgt.GetNextNo(CashMgt."Utilization Receipt Nos", Today, true);
//                             DefaultDimensionsRec.GetDimensionCodes(DefaultDimensionsRec."Document Type"::"Utilization Receipt", DefaultDimensions);
//                         end;
//                     "Receipt Type"::"Retention Receipt":
//                         begin
//                             CashMgt.Get;
//                             CashMgt.TestField("Retention Receipt Nos");
//                             "No." := NoSeriesMgt.GetNextNo(CashMgt."Retention Receipt Nos", Today, true);
//                             DefaultDimensionsRec.GetDimensionCodes(DefaultDimensionsRec."Document Type"::"Retention Receipt", DefaultDimensions);
//                         end;
//                     "Receipt Type"::AIE:
//                         begin
//                             CashMgt.Get;
//                             CashMgt.TestField("AIE Receipt Nos");
//                             "No." := NoSeriesMgt.GetNextNo(CashMgt."AIE Receipt Nos", Today, true);
//                             DefaultDimensionsRec.GetDimensionCodes(DefaultDimensionsRec."Document Type"::Receipt, DefaultDimensions);
//                         end;
//                     "Receipt Type"::Surrender:
//                         begin
//                             CashMgt.Get;
//                             CashMgt.TestField("Receipt Nos");
//                             "No." := NoSeriesMgt.GetNextNo(CashMgt."Receipt Nos", Today, true);
//                             DefaultDimensionsRec.GetDimensionCodes(DefaultDimensionsRec."Document Type"::Receipt, DefaultDimensions);
//                         end;
//                     "Receipt Type"::"RD Receipts":
//                         begin
//                             CashMgt.Get;
//                             CashMgt.TestField("RD Receipts");
//                             "No." := NoSeriesMgt.GetNextNo(CashMgt."RD Receipts", Today, true);
//                             // DefaultDimensionsRec.GetDimensionCodes(DefaultDimensionsRec."Document Type"::Receipt, DefaultDimensions);
//                         end;
//                 end;
//             end;
//         end;
//         Date := Today;
//         if GuiAllowed then
//             Cashier := UserId;
//         //Default Dimensions
//         DimMgt.GetShortcutDimensions("Dimension Set ID", CurrDimensions);
//         "Dimension Set ID" := PaymentPost.AggregateDimensions(CurrDimensions, DefaultDimensions, CurrDimensions);
//         "Global Dimension 1 Code" := CurrDimensions[1];
//         "Global Dimension 2 Code" := CurrDimensions[2];
//         "Shortcut Dimension 1 Code" := CurrDimensions[1];
//         "Shortcut Dimension 2 Code" := CurrDimensions[2];
//     end;

//     var
//         NoSeriesMgt: Codeunit NoSeriesManagement;
//         GLSetup: Record "General Ledger Setup";
//         CashMgt: Record "Cash Management Setup";
//         DimMgt: Codeunit DimensionManagement;
//         Text051: label 'You may have changed a dimension.\\Do you want to update the lines?';
//         PurchLine: Record "Receipt Lines1";
//         MissingExchangeRatesQst: label 'There are no exchange rates for currency %1 and date %2. Do you want to add them now? Otherwise, the last change you made will be reverted.', Comment = '%1 - currency code, %2 - posting date';
//         Text022: label 'Do you want to update the exchange rate?';
//         CurrencyDate: Date;
//         CurrencyCode: Code[10];
//         CurrExchRate: Record "Currency Exchange Rate";
//         Confirmed: Boolean;
//         HideValidationDialog: Boolean;
//         ExaminationSetup: Record "Examination Setup";
//         DimensionValue: Record "Dimension Value";
//         PaymentPost: Codeunit "Payments-Post";

//     procedure CreateDim(Type1: Integer; No1: Code[20]; Type2: Integer; No2: Code[20]; Type3: Integer; No3: Code[20]; Type4: Integer; No4: Code[20])
//     var
//         SourceCodeSetup: Record "Source Code Setup";
//         TableID: array[10] of Integer;
//         No: array[10] of Code[20];
//         OldDimSetID: Integer;
//     begin
//         SourceCodeSetup.Get;
//         TableID[1] := Type1;
//         No[1] := No1;
//         TableID[2] := Type2;
//         No[2] := No2;
//         TableID[3] := Type3;
//         No[3] := No3;
//         TableID[4] := Type4;
//         No[4] := No4;
//         OnAfterCreateDimTableIDs(Rec, CurrFieldNo, TableID, No);

//         "Shortcut Dimension 1 Code" := '';
//         "Shortcut Dimension 2 Code" := '';
//         OldDimSetID := "Dimension Set ID";
//         "Dimension Set ID" :=
//           DimMgt.GetRecDefaultDimID(
//             Rec, CurrFieldNo, TableID, No, SourceCodeSetup.Purchases, "Shortcut Dimension 1 Code", "Shortcut Dimension 2 Code", 0, 0);

//         if (OldDimSetID <> "Dimension Set ID") and PurchLinesExist then begin
//             Modify;
//             UpdateAllLineDim("Dimension Set ID", OldDimSetID);
//         end;
//     end;

//     local procedure RevalidateDimensions()
//     var
//         DimensionManagement: Codeunit DimensionManagement;
//     begin
//         if "Dimension Set ID" = 0 then begin
//             DimensionManagement.ValidateShortcutDimValues(1, "Shortcut Dimension 1 Code", "Dimension Set ID");
//             DimensionManagement.ValidateShortcutDimValues(2, "Shortcut Dimension 2 Code", "Dimension Set ID");
//             Modify();
//             Commit();
//         end;
//     end;

//     procedure ShowEditDimension(Editable: Boolean)
//     var
//         DimensionManagement: Codeunit DimensionManagement;
//         DimensionCodes: array[8] of Code[20];
//         NewDimensionSetId: Integer;
//     begin
//         RevalidateDimensions();
//         if Editable then begin
//             NewDimensionSetId := DimensionManagement.EditDimensionSet("Dimension Set ID", 'Dimensions');
//             if NewDimensionSetId <> "Dimension Set ID" then begin
//                 DimensionManagement.GetShortcutDimensions(NewDimensionSetId, DimensionCodes);
//                 "Dimension Set ID" := NewDimensionSetId;
//                 "Shortcut Dimension 1 Code" := DimensionCodes[1];
//                 "Shortcut Dimension 2 Code" := DimensionCodes[2];
//                 Rec.Modify();
//             end;
//         end else begin
//             DimensionManagement.ShowDimensionSet("Dimension Set ID", 'Dimensions');
//         end;
//     end;

//     procedure GetHideValidationDialog(): Boolean
//     begin
//         exit(HideValidationDialog);
//     end;

//     procedure PurchLinesExist(): Boolean
//     begin
//         PurchLine.Reset;
//         //PurchLine.SETRANGE("Document Type","Document Type");
//         PurchLine.SetRange("Receipt No.", "No.");
//         exit(PurchLine.FindFirst);
//     end;

//     procedure SetHideValidationDialog(NewHideValidationDialog: Boolean)
//     begin
//         HideValidationDialog := NewHideValidationDialog;
//     end;

//     procedure ShowDocDim()
//     var
//         OldDimSetID: Integer;
//     begin
//         OldDimSetID := "Dimension Set ID";
//         // "Dimension Set ID" :=
//         //   DimMgt.EditDimensionSet2(
//         //     "Dimension Set ID",StrSubstNo('%1 %2',"Document Type","No."),
//         //     "Shortcut Dimension 1 Code","Shortcut Dimension 2 Code");

//         if OldDimSetID <> "Dimension Set ID" then begin
//             Modify;
//             if PurchLinesExist then
//                 UpdateAllLineDim("Dimension Set ID", OldDimSetID);
//         end;
//     end;

//     procedure ValidateShortcutDimCode(FieldNumber: Integer; var ShortcutDimCode: Code[20])
//     var
//         OldDimSetID: Integer;
//     begin
//         OldDimSetID := "Dimension Set ID";
//         DimMgt.ValidateShortcutDimValues(FieldNumber, ShortcutDimCode, "Dimension Set ID");
//         if "No." <> '' then
//             //Modify;

//         if OldDimSetID <> "Dimension Set ID" then begin
//                 //Modify;
//                 if PurchLinesExist then
//                     UpdateAllLineDim("Dimension Set ID", OldDimSetID);
//             end;
//     end;

//     local procedure ConfirmUpdateCurrencyFactor(): Boolean
//     begin
//         if GetHideValidationDialog then
//             Confirmed := true
//         else
//             Confirmed := Confirm(Text022, false);
//         if Confirmed then
//             Validate("Currency Factor")
//         else
//             "Currency Factor" := xRec."Currency Factor";
//         exit(Confirmed);
//     end;

//     local procedure RevertCurrencyCodeAndPostingDate()
//     begin
//         "Currency Code" := xRec."Currency Code";
//         Date := xRec.Date;
//         Modify;
//     end;

//     local procedure UpdateAllLineDim(NewParentDimSetID: Integer; OldParentDimSetID: Integer)
//     var
//         NewDimSetID: Integer;
//         ReceivedShippedItemLineDimChangeConfirmed: Boolean;
//     begin
//         // Update all lines with changed dimensions.

//         if NewParentDimSetID = OldParentDimSetID then
//             exit;
//         // if not Confirm(Text051) then
//         //     exit;

//         PurchLine.Reset;
//         //PurchLine.SETRANGE("Document Type","Document Type");
//         PurchLine.SetRange("Receipt No.", "No.");
//         PurchLine.LockTable;
//         if PurchLine.Find('-') then
//             repeat
//                 NewDimSetID := DimMgt.GetDeltaDimSetID(PurchLine."Dimension Set ID", NewParentDimSetID, OldParentDimSetID);
//                 if PurchLine."Dimension Set ID" <> NewDimSetID then begin
//                     PurchLine."Dimension Set ID" := NewDimSetID;


//                     DimMgt.UpdateGlobalDimFromDimSetID(
//                       PurchLine."Dimension Set ID", PurchLine."Shortcut Dimension 1 Code", PurchLine."Shortcut Dimension 2 Code");
//                     PurchLine.Modify;
//                 end;
//             until PurchLine.Next = 0;
//     end;

//     local procedure UpdateCurrencyFactor()
//     var
//         UpdateCurrencyExchangeRates: Codeunit "Update Currency Exchange Rates";
//         Updated: Boolean;
//     begin
//         OnBeforeUpdateCurrencyFactor(Rec, Updated);
//         if Updated then
//             exit;

//         if "Currency Code" <> '' then begin
//             if Date <> 0D then
//                 CurrencyDate := Date
//             else
//                 CurrencyDate := WorkDate;

//             if UpdateCurrencyExchangeRates.ExchangeRatesForCurrencyExist(CurrencyDate, "Currency Code") then begin
//                 "Currency Factor" := CurrExchRate.ExchangeRate(CurrencyDate, "Currency Code");

//             end else begin
//                 if Confirm(StrSubstNo(MissingExchangeRatesQst, "Currency Code", CurrencyDate)) then begin
//                     UpdateCurrencyExchangeRates.OpenExchangeRatesPage("Currency Code");
//                     UpdateCurrencyFactor;
//                 end else
//                     RevertCurrencyCodeAndPostingDate;
//             end;
//         end else
//             "Currency Factor" := 0;
//     end;

//     procedure AdjustUtilization(var Receipt: Record "Receipts Header1"; Amount: Decimal; Direction: Enum "Utilization Direction")
//     begin
//         case Direction of
//             Direction::Upwards:
//                 Receipt."Utilized Amount" += Amount;
//             Direction::Downwards:
//                 Receipt."Utilized Amount" -= Amount;
//         end;
//     end;

//     procedure GetInvoiceItemRevenueAccount(PRN: Text[50]): Code[50]
//     var
//         SalesHeader: Record "Sales Header";
//         SalesLine: Record "Sales Line";
//         Item: Record Item;
//         Customer: Record Customer;
//         GenPostingSetUp: Record "General Posting Setup";
//     begin
//         SalesHeader.Reset;
//         SalesHeader.SetRange("Your Reference", PRN);
//         if SalesHeader.FindFirst() then begin
//             SalesLine.Reset;
//             SalesLine.SetRange("Document No.", SalesHeader."No.");
//             SalesLine.SetRange(Type, SalesLine.Type::Item);
//             if SalesLine.FindFirst() then begin
//                 if Item.Get(SalesLine."No.") then begin
//                     Item.TestField("Gen. Prod. Posting Group");
//                     if Customer.Get(SalesHeader."Sell-to Customer No.") then;
//                     Customer.TestField("Gen. Bus. Posting Group");
//                     GenPostingSetUp.Get(Customer."Gen. Bus. Posting Group", Item."Gen. Prod. Posting Group");
//                     GenPostingSetUp.TestField("Sales Account");
//                     exit(GenPostingSetUp."Sales Account");
//                 end;
//             end;
//         end;
//     end;

//     procedure populateReceiptDetails(var paymentsRec: Record Payments)
//     var
//         receiptLines: Record "Receipt Lines1";
//         pvLines: Record "PV Lines";
//         lineNumber: Integer;
//         imprestLines: Record "Imprest Lines";

//     begin
//         if paymentsRec."Payment Type" = paymentsRec."Payment Type"::Imprest then begin
//             imprestLines.reset();
//             imprestLines.SetRange(No, paymentsRec."No.");
//             if imprestLines.FindSet() then begin
//                 repeat

//                     receiptLines.reset();
//                     receiptLines.SetRange("Receipt No.", Rec."No.");
//                     if receiptLines.findLast() then
//                         lineNumber := receiptLines."Line No" + 1
//                     else
//                         lineNumber := 1000;

//                     receiptLines.init();
//                     receiptLines."Receipt No." := Rec."No.";
//                     receiptLines."Line No" := lineNumber;
//                     receiptLines."Account Type" := imprestLines."Account Type"::"G/L Account";
//                     receiptLines."Header Receipt Type" := receiptLines."Header Receipt Type"::"RD Receipts";
//                     // receiptLines."Account No." := pvLines."Account No";
//                     // receiptLines."Account Name" := imprestLines."Account Name";
//                     receiptLines.Amount := imprestLines.Amount;
//                     receiptLines."Global Dimension 1 Code" := imprestLines."Global Dimension 1 Code";
//                     receiptLines."Global Dimension 2 Code" := imprestLines."Global Dimension 2 Code";
//                     receiptLines."Applies to Doc. No" := paymentsRec."No.";
//                     if paymentsRec."Payment Narration" = '' then
//                         receiptLines.Description := 'Receipting PV No. ' + paymentsRec."No."
//                     else
//                         receiptLines.Description := paymentsRec."Payment Narration";

//                     receiptLines.insert();
//                 until pvLines.Next() = 0;
//             end;
//         end
//         else begin
//             pvLines.reset();
//             pvLines.SetRange(No, paymentsRec."No.");
//             if pvLines.FindSet() then begin
//                 repeat

//                     receiptLines.reset();
//                     receiptLines.SetRange("Receipt No.", Rec."No.");
//                     if receiptLines.findLast() then
//                         lineNumber := receiptLines."Line No" + 1
//                     else
//                         lineNumber := 1000;

//                     receiptLines.init();
//                     receiptLines."Receipt No." := Rec."No.";
//                     receiptLines."Line No" := lineNumber;
//                     receiptLines."Account Type" := pvLines."Account Type"::"G/L Account";
//                     receiptLines."Header Receipt Type" := receiptLines."Header Receipt Type"::"RD Receipts";
//                     // receiptLines."Account No." := pvLines."Account No";
//                     // receiptLines."Account Name" := pvLines."Account Name";
//                     receiptLines.Amount := pvLines.Amount;
//                     receiptLines."Global Dimension 1 Code" := pvLines."Shortcut Dimension 1 Code";
//                     receiptLines."Global Dimension 2 Code" := pvLines."Shortcut Dimension 2 Code";
//                     receiptLines."Applies to Doc. No" := paymentsRec."No.";
//                     if paymentsRec."Payment Narration" = '' then
//                         receiptLines.Description := 'Receipting PV No. ' + paymentsRec."No."
//                     else
//                         receiptLines.Description := paymentsRec."Payment Narration";

//                     receiptLines.insert();
//                 until pvLines.Next() = 0;
//             end;
//         end;

//         Rec."Shortcut Dimension 1 Code" := paymentsRec."Shortcut Dimension 1 Code";
//         Rec."Shortcut Dimension 2 Code" := paymentsRec."Shortcut Dimension 2 Code";

//         Rec.Modify();
//         paymentsRec.Retried := true;

//     end;



//     procedure clearReceiptLines()
//     var
//         receiptLines: Record "Receipt Lines1";
//         pvLines: Record "PV Lines";

//     begin

//         receiptLines.reset();
//         receiptLines.SetRange("Receipt No.", Rec."No.");
//         if receiptLines.FindSet() then begin
//             repeat
//                 receiptLines.delete();
//             until receiptLines.Next = 0;
//             Rec."Shortcut Dimension 1 Code" := '';
//             Rec."Shortcut Dimension 2 Code" := '';
//             // Rec."Bounced Payment Doc" := '';
//             Rec.Modify();

//         end;



//     end;

//     procedure isPaymentReceipted(docNo: Code[20])
//     var
//         receipts: Record "Receipts Header1";

//     begin
//         receipts.Reset();
//         receipts.SetRange("Bounced Payment Doc", docNo);
//         if receipts.FindSet() then begin
//             repeat
//                 if receipts."No." <> Rec."No." then
//                     Error('This payment has already been used in receipt %1', receipts."No.");
//             until receipts.Next() = 0;
//         end;

//     end;

//     procedure GetRemainingAmount(ReceiptNo: Code[20]): Decimal
//     var
//         ReceiptHeader: Record "Receipts Header1";
//     begin
//         if ReceiptHeader.Get(ReceiptNo) then begin
//             ReceiptHeader.CalcFields(Amount, "Total Committed Amount");
//             exit(ReceiptHeader.Amount + ReceiptHeader."Balance BF" - ReceiptHeader."Total Committed Amount");
//         end;

//     end;

//     procedure markReceiptAsProcessed(docNo: Code[20])

//     var
//         outwardPayment: Record "Outward Payment Buffer";

//     begin

//         outwardPayment.reset();
//         outwardPayment.SetRange("Source Document No.", docNo);
//         if outwardPayment.FindFirst() then begin
//             outwardPayment.receiptProcessed := true;
//             outwardPayment.Modify()
//         end

//     end;


//     procedure getBankAccountNumber(AccNo: Code[20]): Code[50]

//     var
//         bankAccount: Record "Bank Account";

//     begin
//         bankAccount.reset();
//         bankAccount.SetRange("No.", AccNo);
//         if bankAccount.FindFirst() then
//             exit(bankAccount."Bank Account No.")


//     end;

//     [IntegrationEvent(false, false)]
//     local procedure OnAfterCreateDimTableIDs(var ReceiptHeader: Record "Receipts Header1"; FieldNo: Integer; var TableID: array[10] of Integer; var No: array[10] of Code[20])
//     begin
//     end;

//     [IntegrationEvent(false, false)]
//     local procedure OnBeforeUpdateCurrencyFactor(var ReceiptHeader: Record "Receipts Header1"; var Updated: Boolean)
//     begin
//     end;
// }

