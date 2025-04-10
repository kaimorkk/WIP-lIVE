
xmlport 70003 "Import Procurement Plan1"
{
    Format = VariableText;

    schema
    {
        textelement(Root)
        {
            tableelement("Procurement Plan Entry"; "Procurement Plan Entry")
            {
                XmlName = 'ProcurementPlan';
                fieldelement(Plan; "Procurement Plan Entry"."Procurement Plan ID")
                {
                }
                fieldelement(EntryNo; "Procurement Plan Entry"."Entry No.")
                {
                }
                fieldelement(PlanningCategory; "Procurement Plan Entry"."Planning Category")
                {
                }
                fieldelement(ProcurementType; "Procurement Plan Entry"."Procurement Type")
                {
                }
                fieldelement(ProcurementMethod; "Procurement Plan Entry"."Procurement Method")
                {
                }
                fieldelement(Solicitationtype; "Procurement Plan Entry"."Solicitation Type")
                {
                }
                fieldelement(FundingSource; "Procurement Plan Entry"."Funding Source ID")
                {
                }
                fieldelement(GlobalDimension1Code; "Procurement Plan Entry"."Global Dimension 1 Code")
                {
                }
                fieldelement(GlobalDimension2Code; "Procurement Plan Entry"."Global Dimension 2 Code")
                {
                }
                fieldelement(Quantity; "Procurement Plan Entry".Quantity)
                {
                }
                fieldelement(UnitCost; "Procurement Plan Entry"."Unit Cost")
                {
                }
                fieldelement(total; "Procurement Plan Entry"."Line Budget Cost")
                {
                }
                fieldelement(preferenceReservation; "Procurement Plan Entry"."Preference/Reservation Code")
                {
                }
                fieldelement(Description; "Procurement Plan Entry".Description)
                {
                }
                fieldelement(PROJ; "Procurement Plan Entry"."Budget Control Job No")
                {
                }
                fieldelement(Taskno; "Procurement Plan Entry"."Budget Control Job Task No.")
                {
                }
                fieldelement(startdate; "Procurement Plan Entry"."Procurement Start Date")
                {
                }
                fieldelement(enddate; "Procurement Plan Entry"."Procurement End Date")
                {
                }
                fieldelement(days; "Procurement Plan Entry"."Procurement Duration (Days)")
                {
                }
                fieldelement(WomenAmount; "Procurement Plan Entry"."Women Amount")
                {
                }
                fieldelement(Women; "Procurement Plan Entry"."Women %")
                {
                }
                fieldelement(Youth; "Procurement Plan Entry"."Youth %")
                {
                }
                fieldelement(YouthAmount; "Procurement Plan Entry"."Youth Amount")
                {
                }
                fieldelement(PWD; "Procurement Plan Entry"."PWD %")
                {
                }
                fieldelement(PWDAmount; "Procurement Plan Entry"."PWD Amount")
                {
                }
                fieldelement(MarginofPreference; "Procurement Plan Entry"."Margin of Preference")
                {
                }
                fieldelement(Q1Amount; "Procurement Plan Entry"."Q1 Amount")
                {
                }
                fieldelement(Q1Quantity; "Procurement Plan Entry"."Q1 Quantity")
                {
                }
                fieldelement(Q2Quantity; "Procurement Plan Entry"."Q2 Quantity")
                {
                }
                fieldelement(Q2Amount; "Procurement Plan Entry"."Q2 Amount")
                {
                }
                fieldelement(Q3Quantity; "Procurement Plan Entry"."Q3 Quantity")
                {
                }
                fieldelement(Q3Amount; "Procurement Plan Entry"."Q3 Amount")
                {
                }
                fieldelement(Q4Quantity; "Procurement Plan Entry"."Q4 Quantity")
                {
                }
                fieldelement(Q4Amount; "Procurement Plan Entry"."Q4 Amount")
                {
                }
                fieldelement(ShortcutDimension3Code; "Procurement Plan Entry"."Shortcut Dimension 3 Code")
                {
                }
                fieldelement(ShortcutDimension4Code; "Procurement Plan Entry"."Shortcut Dimension 4 Code")
                {
                }
                fieldelement(ShortcutDimension5Code; "Procurement Plan Entry"."Shortcut Dimension 5 Code")
                {
                }
                fieldelement(ShortcutDimension6Code; "Procurement Plan Entry"."Shortcut Dimension 6 Code")
                {
                }
                fieldelement(ShortcutDimension8Code; "Procurement Plan Entry"."Shortcut Dimension 8 Code")
                {
                }

                trigger OnAfterInsertRecord()
                begin

                    ProcurementPlanLines.Reset;
                    if ProcurementPlanLines.FindLast then
                        LineNo := ProcurementPlanLines."PP Line No" + 1;

                    PPEntry.Reset;
                    PPEntry.SetRange("Procurement Plan ID", "Procurement Plan Entry"."Procurement Plan ID");
                    if PPEntry.FindSet then begin
                        repeat
                            ProcurementPlanLines.Reset;
                            ProcurementPlanLines.SetRange("Procurement Plan ID", "Procurement Plan Entry"."Procurement Plan ID");
                            ProcurementPlanLines.SetRange("Planning Category", "Procurement Plan Entry"."Planning Category");
                            if not ProcurementPlanLines.FindSet then begin
                                ProcurementPlanLines.Init;
                                ProcurementPlanLines.Validate(ProcurementPlanLines."Procurement Plan ID", "Procurement Plan Entry"."Procurement Plan ID");
                                ProcurementPlanLines."PP Line No" := LineNo + 1;
                                ProcurementPlanLines.Validate("Planning Category", "Procurement Plan Entry"."Planning Category");
                                ProcurementPlanLines.Validate("Procurement Type", "Procurement Plan Entry"."Procurement Type");
                                ProcurementPlanLines.Validate("Solicitation Type", "Procurement Plan Entry"."Solicitation Type");
                                ProcurementPlanLines.Validate("Procurement Method", "Procurement Plan Entry"."Procurement Method");
                                ProcurementPlanLines.Validate("Primary Source of Funds", "Procurement Plan Entry"."Funding Source ID");
                                ProcurementPlanLines.Insert(true);
                                LineNo += 1;
                            end;
                        until PPEntry.Next = 0;
                    end;
                end;
            }
        }
    }

    requestpage
    {

        layout
        {
        }

        actions
        {
        }
    }

    trigger OnPostXmlPort()
    begin
        Message('Procurement Plan Imported Successfully');
    end;

    var
        ProcurementPlanLines: Record "Procurement Plan Lines";
        PPEntry: Record "Procurement Plan Entry";
        PPActivity: Record "Procurement Activity Code";
        PPPlanActivity: Record "PP Purchase Activity Schedule";
        LineNo: Integer;
}

