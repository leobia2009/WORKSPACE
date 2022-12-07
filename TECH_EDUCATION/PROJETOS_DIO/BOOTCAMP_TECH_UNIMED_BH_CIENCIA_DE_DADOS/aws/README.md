# dio-live-dynamodb
Repositório para o live coding do dia 30/09/2021 sobre o Amazon DynamoDB

### Serviço utilizado
  - Amazon DynamoDB
  - Amazon CLI para execução em linha de comando 
  - Para rodar o CLI no windows 8 substituir as \ por ^

### Comandos para execução do experimento:


- Criar uma tabela

```
aws dynamodb create-table
   --table-name Music 
   --attribute-definitions
	   AttributeName=Artist,AttributeType=S  
	   AttributeName=SongTitle,AttributeType=S 
   --key-schema    
	   AttributeName=Artist,KeyType=HASH 
	   AttributeName=SongTitle,KeyType=RANGE  
   --provisioned-throughput        
	   ReadCapacityUnits=10,WriteCapacityUnits=5

- Inserir um item

```
aws dynamodb put-item \
 --table-name Music \
 --item file://itemmusic.json
```

- Inserir múltiplos itens

```
aws dynamodb batch-write-item \
 --request-items file://batchmusic.json
```



- Criar um index global secundário baeado no título do álbum

```
aws dynamodb update-table \
    --table-name Music \
    --attribute-definitions AttributeName=AlbumTitle,AttributeType=S \
    --global-secondary-index-updates file://indAlbumTitle.json
 
```
- Criar um index global secundário baseado no título da musica e no ano de lancamento

```

aws dynamodb update-table \
    --table-name Music \
    --attribute-definitions^
        AttributeName=SongTitle,AttributeType=S \
        AttributeName=SongYear,AttributeType=S \
    --global-secondary-index-updates file://indSongYear.json

```

- Criar um index global secundário baseado no nome do artista e no título do álbum

```
aws dynamodb update-table \
    --table-name Music \
    --attribute-definitions \
        AttributeName=Artist,AttributeType=S \
        AttributeName=AlbumTitle,AttributeType=S \
    --global-secondary-index-updates file://indArtistAlbum.json
        
```

- Pesquisar item por artista

```
aws dynamodb query \
	 --table-name Music 
	 --key-condition-expression "Artist = :artist" \
	 --expression-attribute-values "{\":artist\":{\"S\":\"Iron Maiden\"}}"
	   
```

- Pesquisar item por artista e título da música

```
aws dynamodb query \
	 --table-name Music \
	 --key-condition-expression "Artist = :artist and SongTitle = :title" \
	 --expression-attribute-values "{\":artist\":{\"S\":\"Iron Maiden\"},\":title\":{\"S\":\"Wasting Love\"}}"
	   
```



- Pesquisar item por artista e título da música

```
aws dynamodb query \
	 --table-name Music \
	 --key-condition-expression "Artist = :artist and SongTitle = :title" \
	 --expression-attribute-values file://keyconditions.json
```

- Pesquisa pelo index secundário baseado no título do álbum

```
aws dynamodb query \   
    --table-name Music \
    --index-name AlbumTitle-index \
    --key-condition-expression "AlbumTitle = :name" \
    --expression-attribute-values  "{\":name\":{\"S\":\"Fear of the Dark\"}}"
```

- Pesquisa pelo index secundário baseado no nome do artista e no título do álbum

```
aws dynamodb query \
    --table-name Music \
    --index-name ArtistAlbumTitle-index \
    --key-condition-expression "Artist = :v_artist and AlbumTitle = :v_title" \
    --expression-attribute-values  '{":v_artist":{"S":"Iron Maiden"},":v_title":{"S":"Fear of the Dark"} }'
```

- Pesquisa pelo index secundário baseado no título da música e no ano

```
aws dynamodb query \
    --table-name Music \
    --index-name SongTitleYear-index \
    --key-condition-expression "SongTitle = :v_song and SongYear = :v_year" \
    --expression-attribute-values  '{":v_song":{"S":"Wasting Love"},":v_year":{"S":"1992"} }'
```
