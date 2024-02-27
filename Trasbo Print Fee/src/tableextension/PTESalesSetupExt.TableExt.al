tableextension 55000 "PTE Sales Setup Ext" extends "Sales & Receivables Setup"
{
    fields
    {
        field(55000; "Print Fee Output Profile"; Code[20])
        {
            CaptionML = DAN = 'Print Output Profil';
            DataClassification = ToBeClassified;
            TableRelation = "CDO Send Code"."Send Code";
        }

        field(55001; "Print Fee G/L Account"; Code[20])
        {
            CaptionML = DAN = 'Print gebyr Finanskonto';
            DataClassification = ToBeClassified;
            TableRelation = "G/L Account"."No.";
        }

        field(55002; "Print Fee Comment Code"; Code[20])
        {
            CaptionML = DAN = 'Print Gebyr Kommentar';
            DataClassification = ToBeClassified;
            TableRelation = "Standard Text".Code;
        }
    }
}