-- A graph G is a pair (V,A) with V being a finite nin-empty set and A a set of pairs that represent the edges of the graph.
    -- The elements of V are called vertices(or nodes).
    -- The elements of A are called edges.
    -- the number of vertices |V| is called order of G.
    -- The number of edges |A| is called size of G.

local Graph = {}

function Graph.new()
    return{vertices = {}, edges = {}}
end

function Graph.addVertex(graph,vertex)
    graph.vertices[vertex] = true
    graph.edges[vertex] = graph.edges[vertex] or {}
end

function Graph.addEdge(graph, vertex1, vertex2)
    graph.edges[vertex1][vertex2] = true
    graph.edges[vertex2][vertex1] = true
end

function Graph.getAdjecentVertices(graph,vertex)
    local adjacent = {}
    for v in pairs(graph.edges[vertex]) do
        table.insert(adjacent,v)
    end
    return adjacent
end

--Example Usage

local myGraph = Graph.new()

Graph.addVertex(myGraph,"A")
Graph.addVertex(myGraph,"B")
Graph.addVertex(myGraph,"C")
Graph.addVertex(myGraph,"D")

Graph.addEdge(myGraph,"A","B")
Graph.addEdge(myGraph,"A","C")
Graph.addEdge(myGraph,"B","C")
Graph.addEdge(myGraph,"B","D")


local adjacentToA = Graph.getAdjecentVertices(myGraph,"A")
print("Vertices adjacent to A:", table.concat(adjacentToA, ", "))

local adjacentToB = Graph.getAdjecentVertices(myGraph,"B")
print("Vertices adjacent to B:", table.concat(adjacentToB, ", "))