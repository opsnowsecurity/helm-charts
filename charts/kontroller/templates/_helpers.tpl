{{/*
Expand the name of the chart.
*/}}
{{- define "kontroller.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "kontroller.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "kontroller.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "kontroller.labels" -}}
app: {{ include "kontroller.fullname" . }}
helm.sh/chart: {{ include "kontroller.chart" . }}
{{ include "kontroller.selectorLabels" . }}
app.kubernetes.io/version: {{ default .Chart.AppVersion .Values.version | quote }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "kontroller.selectorLabels" -}}
app: {{ include "kontroller.fullname" . }}
app.kubernetes.io/name: {{ include "kontroller.fullname" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "kontroller.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "kontroller.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}

{{/*
Return namespace of the release
*/}}
{{- define "kontroller.namespace" -}}
{{- default .Release.Namespace .Values.namespace }}
{{- end -}}


{{/*
Return the target Kubernetes version - from redis chart
*/}}
{{- define "common.capabilities.kubeVersion" -}}
{{- if .Values.global }}
    {{- if .Values.global.kubeVersion }}
    {{- .Values.global.kubeVersion -}}
    {{- else }}
    {{- default .Capabilities.KubeVersion.Version .Values.kubeVersion -}}
    {{- end -}}
{{- else }}
{{- default .Capabilities.KubeVersion.Version .Values.kubeVersion -}}
{{- end -}}
{{- end -}}

{{/*
Return the appropriate apiVersion for Horizontal Pod Autoscaler. - from redis chart
*/}}
{{- define "common.capabilities.hpa.apiVersion" -}}
{{- if semverCompare "<1.23-0" (include "common.capabilities.kubeVersion" .context) -}}
{{- if .beta2 -}}
{{- print "autoscaling/v2beta2" -}}
{{- else -}}
{{- print "autoscaling/v2beta1" -}}
{{- end -}}
{{- else -}}
{{- print "autoscaling/v2" -}}
{{- end -}}
{{- end -}}

{{/*
Create the name of the service account for kollector
*/}}
{{- define "kollector.serviceAccountName" -}}
{{- if .Values.kollector.serviceAccount.create }}
{{- default "default" .Values.kollector.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}

{{/*
kollector labels
*/}}
{{- define "kollector.labels" -}}
app.kubernetes.io/name: "kollector"
{{- end }}

{{/*
Return namespace of kollector
*/}}
{{- define "kollector.namespace" -}}
{{- default .Release.Namespace .Values.kollector.namespace }}
{{- end -}}